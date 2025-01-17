require 'json'

class ReceiptDissector
  ERROR_MARGIN = 1.5
  HORIZONTAL_MARGIN_MULTIPLIER = 1.5
  CATEGORIES = { "balance"=>/(balance|total)(\W|$|\s)/, "deduction"=>/^(?=.*-)\$?(\d{1,3}(?:,\d{3})*\.\d{2})$/, "price"=>/^(?!.*[\-@\/])\$?(\d{1,3}(?:,\d{3})*\.\d{2})$/, "item"=>/[a-zA-Z\/]+/, "price_disqualifier"=>/[\-\/@]/, "tax"=>/^(?:tax|taxes)(?:$|\s)/, "subtotal"=>/^(?:subtotal|total before|sub total|)(?:$|\s)/ }
  attr_reader :balance, :items, :subtotal, :tax

  def initialize(vision_api_response)
    @data = vision_api_response
    @full_text = @data["responses"].first["textAnnotations"].first["description"].downcase
    @annotation_polys = @data["responses"].first["textAnnotations"][1..]
    @balance = 0
    @items = {}
    @deductions = {}
    @subtotal = nil
    @tax = nil
  end

  def identify_vendor
    sanitized_text = @full_text.gsub(/\n+/, " ")
    ## TODO
    # Replace vendor_names with a collection of user vendors
    vendor_names = ["Safeway", "King Soopers", "Costco"]
    match_data = sanitized_text.match(vendor_names)
    match_data[1] if match_data
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

    {"balance"=>balance, "items"=>items}
  end

  def find_items(potential_prices)
    item_list = {}
    last_item_index = 0
    keep_searching = true
    potential_prices.each do |num_poly|
      break if num_poly["description"].match(CATEGORIES["price"])[1] == @balance
      matching_items = @annotation_polys.select { |poly| fits_on_slope?(poly, num_poly)}

      next unless matching_items.count > 1

      ordered_items = order_by_direction(matching_items, :right)
      line_price = nil
      line_price_index = nil
      item_description = []

      ordered_items.each_with_index do |poly, i|
        item_block = []
        if poly["description"].match?(CATEGORIES["price"])
          for j in -1..1
            if ordered_items[i + j]
              item_block << ordered_items[i + j]["description"]
            end
          end

          unless item_block.any? { |price_candidate| price_candidate.match?(CATEGORIES["price_disqualifier"]) }
            line_price = poly["description"].match(CATEGORIES["price"])[1]
            line_price_index = i
          end
        end
      end
      
      next unless line_price && line_price_index

      ordered_items.each_with_index do |poly, i|
        next unless i > line_price_index
        if poly["description"].downcase.match?(CATEGORIES["subtotal"])
          keep_searching = false
          @subtotal = line_price
        elsif poly["description"].downcase.match?(CATEGORIES["tax"])
          keep_searching = false
          @tax = line_price
        elsif poly["description"].match?(CATEGORIES["item"]) && ((item_description.empty?) || within_horizontal_margin?(poly, ordered_items[i - 1]))
          item_description << poly["description"]
        else
          break
        end
      end

      item_list[item_description.reverse.join(" ").downcase] = line_price unless !keep_searching
    end
    item_list
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

  def within_horizontal_margin?(poly_1, poly_2)
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
    (comp_1 - comp_2).abs < (margin.abs * 2.5)
  end

  def lower_left_corner(poly)
    poly["boundingPoly"]["vertices"][0]["x"].to_f
  end

  def order_by_direction(polys, starting_direction)
    raise "Must input more than one poly as first argument" unless polys.respond_to?(:count) && polys.all? { |poly| !poly["boundingPoly"]["vertices"].nil? }
    if starting_direction.to_s == "left"
      polys.sort_by{ |poly| lower_left_corner(poly) }
    elsif starting_direction.to_s == "right"
      polys.sort_by{ |poly| lower_left_corner(poly) }.reverse
    else
      raise "Second argument must be either 'right' or 'left'"
    end
  end
  
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