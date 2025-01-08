require 'json'

class ReceiptDissector
  ERROR_MARGIN = 0.01

  def initialize(vision_api_response)
    @data = JSON.parse(vision_api_response)
    @full_text = @data["responses"].first["textAnnotations"].first["description"].downcase
  end

  def identify_vendor
    sanitized_text = @full_text.gsub(/\n+/, " ")
    ## Placeholder
    vendor_names = ["Safeway", "King Soopers". "Costco"]
    match_data = sanitized_text.match(vendor_names)
    match_data[1] if match_data
  end

  def identify_items

  end

  def identify_total
    @tax_poly = nil
    @balance_poly = nil
    annotation_polys = @data["responses"].first["textAnnotations"][1..]
    balance_poly_index = nil

    annotation_polys.each_with_index do |poly, i|
      if !@tax_poly.nil? && poly["description"].downcase.match?(/(balance|total)(\W|$|\s)/)
        @balance_poly = poly
        balance_poly_index = i
        break
      end

      @tax_poly = poly if poly["description"].downcase.match?(/^(?:tax|taxes)(?:[^a-zA-Z]|$|\s)/)
    end

    total_price_poly = annotation_polys[balance_poly_index..].detect do |poly|
      next unless poly["description"].match?(/^\$?\d{1,3}(?:,\d{3})*\.\d{2}$/)
      fits_on_slope?(poly)
    end
    return total_price_poly["description"].scan(/\d{1,3}(?:,\d{3})*\.\d{2}$/).first.gsub(",", "").to_f.round(2) if total_price_poly
  end

  private

  def fits_on_slope?(poly)
    balance_corners = @balance_poly["boundingPoly"]["vertices"]
    balance_top_left = balance_corners[0]
    balance_top_right = balance_corners[1]
    poly_top_left = poly["boundingPoly"]["vertices"][0]

    y1 = balance_top_left["y"].to_f
    y2 = balance_top_right["y"].to_f
    y3 = poly_top_left["y"].to_f
    x1 = balance_top_left["x"].to_f
    x2 = balance_top_right["x"].to_f
    x3 = poly_top_left["x"].to_f
    
    slope = (y2-y1) / (x2-x1)
    expected_y_value = y1 + slope * (x3 - x1)
    (expected_y_value - y3) <= ERROR_MARGIN
  end
end