require 'json'

class ReceiptDissector
  ERROR_MARGIN = 1.8
  HORIZONTAL_MARGIN_MULTIPLIER = 1.5
  CATEGORIES = { "balance"=>/(balance|total)(\W|$|\s)/, "deduction"=>/^(?=.*-)\$?(\d{1,3}(?:,\d{3})*\.\d{2})$/, "price"=>/^(?!.*[\-@\/])\$?(\d{1,3}(?:,\d{3})*\.\d{2})$/, "item"=>/[a-zA-Z\/]+/, "price_disqualifier"=>/[\-\/@]/, "tax"=>/^(?:tax|taxes)(?:$|\b)/, "subtotal"=>/^(?:subtotal|total before|sub total)(?:$|\b)/ }
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
    lines = receipt_by_line
    @items = find_items(lines)

    {"balance"=>balance, "items"=>items}
  end

  def receipt_by_line
    remaining_polys = @annotation_polys.select { |poly| poly["boundingPoly"]["vertices"][2]["y"] < @balance_poly["boundingPoly"]["vertices"][0]["y"] }
    prices_sorted_horizontally = remaining_polys.select { |poly| 
      poly["description"].match?(CATEGORIES["price"]) && !poly["description"].match?(CATEGORIES["deduction"])
    }.sort_by { |poly| 
      poly["boundingPoly"]["vertices"][2]["x"] 
    }.reverse
    first_price = prices_sorted_horizontally.first
    line_item_prices = prices_sorted_horizontally.take_while{ |poly| fits_within_vertical_box?(first_price, poly) }.sort_by { |poly| poly["boundingPoly"]["vertices"][0]["y"] }

    lines = []
    line_item_prices.each do |price|
      all_line_polys = remaining_polys.select { |poly| fits_on_slope?(price, poly) }
      lines << { price: price, items: all_line_polys } unless all_line_polys.any? { |poly| poly["description"].match?(CATEGORIES["price_disqualifier"]) && within_horizontal_margin?(price, poly)} 
    end
    lines
  end

  def find_items(lines)
    item_list = []

    lines.each do |line|
      price = line[:price]
      blocks = order_by_direction(line[:items], :right)
      description_start_index = blocks.index(price) + 1
      words = blocks[description_start_index..].select { |block| block["description"].match? CATEGORIES["item"]}

      if words.any? { |word|  word["description"].downcase.match?(CATEGORIES["subtotal"]) }
        @subtotal = price
        next
      elsif words.any? { |word|  word["description"].downcase.match?(CATEGORIES["tax"]) }
        @tax = price
        next
      end

      description = []
      words.each_with_index do |word, i|
        description << word["description"].downcase
        break if words[i + 1] && !within_horizontal_margin?(words[i + 1], word)
      end

      next if description.empty?
      description = description.reverse.join(" ")

      item_list << { description => line[:price]["description"] }
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
    margin = (vertices_1[0]["x"].to_f - vertices_1[1]["x"].to_f) / poly_1["description"].length
    to_the_left = vertices_1[0]["x"].to_f < vertices_2[0]["x"].to_f
    if to_the_left
      comp_1 = vertices_1[1]["x"].to_f
      comp_2 = vertices_2[0]["x"].to_f
    else
      comp_1 = vertices_1[0]["x"].to_f 
      comp_2 = vertices_2[1]["x"].to_f
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
    return false if is_vertical?(poly1) || is_vertical?(poly2)
    first_poly_corners = poly1["boundingPoly"]["vertices"]
    first_poly_bottom_left = first_poly_corners[2]
    first_poly_bottom_right = first_poly_corners[3]
    second_poly_bottom_left = poly2["boundingPoly"]["vertices"][2]
    
    y1 = first_poly_bottom_left["y"].to_f
    y2 = first_poly_bottom_right["y"].to_f
    y3 = second_poly_bottom_left["y"].to_f
    x1 = first_poly_bottom_left["x"].to_f
    x2 = first_poly_bottom_right["x"].to_f
    x3 = second_poly_bottom_left["x"].to_f
    
    slope = (y2-y1) / (x2-x1)
    expected_y_value = y1 + slope * (x3 - x1)
    actual_error = (expected_y_value - y3).abs
    error_percentage = (actual_error / expected_y_value) * 100
    error_percentage <= ERROR_MARGIN
  end

  def is_vertical?(poly)
    return false unless poly["description"].length > 1
    vertices = poly["boundingPoly"]["vertices"]
    if vertices[2]["y"].nil? || vertices[1]["x"].nil? || vertices[0]["x"].nil? || vertices[0]["y"].nil?
      return true
    end
    (vertices[2]["y"] - vertices[0]["y"]).abs > (vertices[1]["x"] - vertices[0]["x"]).abs
  end

  def fits_within_vertical_box?(poly1, poly2)
    vertices1 = poly1["boundingPoly"]["vertices"]
    x_min = vertices1.min_by { |v| v["x"] }["x"]
    x_max = vertices1.max_by { |v| v["x"] }["x"]

    poly2["boundingPoly"]["vertices"].any? { |v| v["x"] >= x_min && v["x"] <= x_max }
  end
end