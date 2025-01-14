require 'json'

class ReceiptDissector
  ERROR_MARGIN = 1.5
  HORIZONTAL_MARGIN_MULTIPLIER = 2.5
  CATEGORIES = { "balance"=>/(balance|total)(\W|$|\s)/, "deduction"=>/^(?=.*-)\$?(\d{1,3}(?:,\d{3})*\.\d{2})$/, "price"=>/^\$?(\d{1,3}(?:,\d{3})*\.\d{2})$/, "item"=>/(?:[a-zA-Z]+)|-/ }
  attr_reader :balance, :items

  def initialize(vision_api_response)
    @data = vision_api_response
    @full_text = @data["responses"].first["textAnnotations"].first["description"].downcase
    @annotation_polys = @data["responses"].first["textAnnotations"][1..]
    @balance = 0
    @items = {}
    @deductions = {}
    @account_items = {}
  end

  def identify_vendor
    sanitized_text = @full_text.gsub(/\n+/, " ")
    ## TODO
    # Replace vendor_names with a collection of user vendors
    vendor_names = ["Safeway", "King Soopers", "Costco"]
    match_data = sanitized_text.match(vendor_names)
    match_data[1] if match_data
  end

  def identify_items

  end

  def parse_receipt
    potential_balance_polys = []
    potential_prices = []
    ## TODO - deductions

    @annotation_polys.each do |poly|
      case categorize_poly(poly["description"].downcase)
      when "balance"
        potential_balance_polys << poly
      when "price"
        potential_prices << poly
      end
    end

    @balance = find_total(potential_balance_polys, potential_prices)
    @items = find_items(potential_prices)

    # {"balance"=>balance, "items"=>items}
  end

  def find_items(potential_prices)
    potential_prices.each do |num_poly|
      matching_items = @annotation_polys.select { |poly| poly["description"] != num_poly["description"] && poly["description"].match?(CATEGORIES["item"]) && fits_on_slope?(poly, num_poly)}

      if !matching_items.empty?
        description = matching_items.sort_by{ |item| item["boundingPoly"]["vertices"][0]["x"]}.map { |item| item["description"] if item["description"].match?(/[a-zA-Z]+/)}.join(" ")
        if matching_items.any? { |item| item["description"].downcase.match?(/^(?:tax|subtotal)/) }
          break
        elsif matching_items.any? { |item| item["description"].match?(/^-$/) && within_horizontal_margin?(item, num_poly) }
          @deductions[description] = num_poly["description"].match(CATEGORIES["price"])[1]
        else
          @items[description] = num_poly["description"].match(CATEGORIES["price"])[1]
        end
      end
    end
    items
  end

  def find_total(potential_balance_polys, potential_prices)
    lines = {}
    potential_balance_polys.each do |poly|
      price = potential_prices.detect { |balance| fits_on_slope?(balance, poly) }
      lines[poly] = price["description"].match(CATEGORIES["price"])[1] if price
    end

    line = lines.max_by { |poly, number| number.to_f }
    @balance_poly = line.first
    return line.last
  end

  def categorize_poly(text)
    matching_poly = CATEGORIES.detect { |category, regex| text.downcase.match?(regex) }
    matching_poly.first if matching_poly
  end

  def within_horizontal_margin?(poly_1, poly_2)\
    vertices_1 = poly_1["boundingPoly"]["vertices"]
    vertices_2 = poly_2["boundingPoly"]["vertices"]
    margin = (vertices_1[0]["x"].to_f - vertices_2[1]["x"].to_f) / poly_1["description"].length
    to_the_left = vertices_1[0]["x"] < vertices_2[0]["x"]
    if to_the_left
      comp_1 = vertices_1[1]["x"]
      comp_2 = vertices_2[0]["x"]
    else
      comp_1 = vertices_1[0]["x"]
      comp_2 = vertices_2[1]["x"]
    end
    (comp_1 - comp_2).abs < (margin * 2.5)
  end

    # def identify_total
  #   @tax_poly = nil
  #   @balance_poly = nil
  #   annotation_polys = @data["responses"].first["textAnnotations"][1..]
  #   balance_poly_index = nil

  #   annotation_polys.each_with_index do |poly, i|
  #     if !@tax_poly.nil? && poly["description"].downcase.match?(/(balance|total)(\W|$|\s)/)
  #       @balance_poly = poly
  #       balance_poly_index = i
  #       break
  #     end

  #     @tax_poly = poly if poly["description"].downcase.match?(/^(?:tax|taxes)(?:[^a-zA-Z]|$|\s)/)
  #   end

  #   total_price_poly = annotation_polys[balance_poly_index..].detect do |poly|
  #     next unless poly["description"].match?(/^\$?\d{1,3}(?:,\d{3})*\.\d{2}$/)
  #     fits_on_slope?(poly, @balance_poly)
  #   end
  #   return total_price_poly["description"].scan(/\d{1,3}(?:,\d{3})*\.\d{2}$/).first.gsub(",", "").to_f.round(2) if total_price_poly
  # end

  private

  def fits_on_slope?(poly1, poly2)
    balance_corners = poly2["boundingPoly"]["vertices"]
    balance_bottom_left = balance_corners[2]
    balance_bottom_right = balance_corners[3]
    poly_bottom_left = poly1["boundingPoly"]["vertices"][2]

    y1 = balance_bottom_left["y"].to_f
    y2 = balance_bottom_right["y"].to_f
    y3 = poly_bottom_left["y"].to_f
    x1 = balance_bottom_left["x"].to_f
    x2 = balance_bottom_right["x"].to_f
    x3 = poly_bottom_left["x"].to_f
    
    slope = (y2-y1) / (x2-x1)
    expected_y_value = y1 + slope * (x3 - x1)
    actual_error = (expected_y_value - y3).abs
    error_percentage = (actual_error / expected_y_value) * 100
    error_percentage <= ERROR_MARGIN
  end
end