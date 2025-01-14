require_relative 'test_object'
require_relative 'test_helper'

class ReceiptDissectorItemsTest < TestObject
  def test_finds_items_costco_1
    dissector = ReceiptDissector.new(response_contents("costco_1"))
    items = {
      "hbo w/almnds"=>"7.89",
      "thomas muffi"=>"8.99",
      "pate variety"=>"9.89",
      "oat milk"=>"9.99",
      "crest mwash"=>"11.99",
      "poopourri 3p"=>"19.99",
      "pasture eggs"=>"7.49",
      "org bs thigh"=>"34.62",
      "mateos salsa"=>"6.89",
      "entertain cr"=>"12.89",
      "spindrift"=>"18.69",
      "ginger beer"=>"15.99"
    }
    dissector.parse_receipt

    assert_same(items.count, dissector.items.count)
    assert_same(items.values.sort, dissector.items.values.sort)
  end

  def response_contents(vendor)
    JSON.parse(File.read(File.join(__dir__,"../responses/#{vendor}.json")))
  end
end