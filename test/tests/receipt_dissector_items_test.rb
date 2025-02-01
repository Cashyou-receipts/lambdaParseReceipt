require_relative 'test_object'
require_relative 'test_helper'

class ReceiptDissectorItemsTest < TestObject
  def test_finds_items_costco_1
    dissector = ReceiptDissector.new(response_contents("costco_1"))
    items = [
      {"hbo w/almnds"=>"7.89"},
      {"thomas muffi"=>"8.99"},
      {"pate variety"=>"9.89"},
      {"oat milk"=>"9.99"},
      {"crest mwash"=>"11.99"},
      {"poopourri 3p"=>"19.99"},
      {"pasture eggs"=>"7.49"},
      {"org bs thigh"=>"34.62"},
      {"mateos salsa"=>"6.89"},
      {"entertain cr"=>"12.89"},
      {"spindrift"=>"18.69"},
      {"ginger beer"=>"15.99"}
    ]
    dissector.parse_receipt
    assert_same(items.count, dissector.items.count)
    assert_same(items.map{ |item| item.values.first }.sort, dissector.items.map{ |item| item.values.first }.sort)
  end
  
  def test_finds_items_hmart_1
    dissector = ReceiptDissector.new(response_contents("hmart_1"))
    items = [
      {"mrng hi chew kiwi"=>"1.99"},
      {"kim bap"=>"4.50"},
      {"pork loin"=>"8.75"},
      {"yellow onion"=>"0.75"},
      {"persian cucumber"=>"7.66"},
      {"daikon radish japanese"=>"2.56"},
      {"italian zucchini squash"=>"2.11"},
      {"yumy groomy camdies"=>"1.79"},
      {"pc original ramen"=>"3.98"},
      {"loose garlic"=>"0.48"},
      {"mrk rice vinegar"=>"8.49"},
      {"jb white sesame seed"=>"4.99"},
      {"pm extra soft tofu"=>"1.79"},
      {"pm organic tofu fi"=>"1.99"}
    ]
    dissector.parse_receipt
    
    assert_same(items.count, dissector.items.count)
    assert_same(items.map{ |item| item.values.first }.sort, dissector.items.map{ |item| item.values.first }.sort)
  end
  
  def test_finds_items_soops_1
    dissector = ReceiptDissector.new(response_contents("soops_1"))
    items = [
      {"chiq bananas"=>"1.01"},
      {"onions green"=>"0.99"},
      {"potatoes red"=>"2.08"},
      {"carrots clip top"=>"1.10"},
      {"ginger root"=>"0.59"},
    ]
    dissector.parse_receipt
    assert_same(items.count, dissector.items.count)
    assert_same(items.map{ |item| item.values.first }.sort, dissector.items.map{ |item| item.values.first }.sort)
  end
  
  def test_finds_items_tj_1
    dissector = ReceiptDissector.new(response_contents("tj_1"))
    items = [
      {"new belgium boodoo juicy"=>"9.99"},
      {"josephsbrau winter r"=>"7.49"},
    ]
    dissector.parse_receipt
    assert_same(items.count, dissector.items.count)
    assert_same(items.map{ |item| item.values.first }.sort, dissector.items.map{ |item| item.values.first }.sort)
  end

  def test_finds_items_dsw
    dissector = ReceiptDissector.new(response_contents("dsw"))
    items = [
      {"juniper trail 2 running shoe"=>"89.96"}
    ]
    dissector.parse_receipt
    assert_same(items.count, dissector.items.count)
    assert_same(items.map{ |item| item.values.first }.sort, dissector.items.map{ |item| item.values.first }.sort)
  end
  
  def test_finds_items_soops_2
    dissector = ReceiptDissector.new(response_contents("soops_2"))
    items = [
      {"spndr wtr sprkllm"=>"6.99"},
      {"ben jerrys ice crm-s"=>"2.99"},
      {"apl hny org"=>"5.26"},
    ]
    dissector.parse_receipt
    assert_same(items.count, dissector.items.count)
    assert_same(items.map{ |item| item.values.first }.sort, dissector.items.map{ |item| item.values.first }.sort)
  end
  
  def test_finds_items_paradies_lagardere
    dissector = ReceiptDissector.new(response_contents("paradies_lagardere"))
    items = [
      {"twiz chry nib peg"=>"5.29"},
      {"lifewtr oz"=>"3.29"}
    ]
    dissector.parse_receipt
    assert_same(items.count, dissector.items.count)
    assert_same(items.map{ |item| item.values.first }.sort, dissector.items.map{ |item| item.values.first }.sort)
  end
  
  def test_finds_items_soops_3
    dissector = ReceiptDissector.new(response_contents("soops_3"))
    items = [
      {"cauliflower"=>"3.47"},
      {"pineapple"=>"2.79"},
      {"sio org tofu"=>"1.67"},
      {"sto org toeu"=>"1.67"},
      {"gthmgrn basil"=>"3.50"},
      {"lacroix sprkl 8pk"=>"3.99"},
      {"lacroix sprkl 8pk"=>"3.99"},
      {"sto applesauce"=>"3.79"},
      {"twin tea"=>"8.49"},
      {"snst ppr red"=>"1.59"},
      {"carrots clip top"=>"0.64"},
      {"ginger root"=>"0.55"},
      {"sto 50/50 blend"=>"3.00"}
    ]
    dissector.parse_receipt
    assert_same(items.count, dissector.items.count)
    assert_same(items.map{ |item| item.values.first }.sort, dissector.items.map{ |item| item.values.first }.sort)
  end

  def test_finds_items_soops_4
    dissector = ReceiptDissector.new(response_contents("soops_4"))
    items = [
      {"haas avocado"=>"4.76"},
      {"hlthade kombucha"=>"3.79"},
      {"snst tomato"=>"1.27"},
      {"limes"=>"0.50"},
      {"shallots"=>"0.92"}
    ]
    dissector.parse_receipt
    assert_same(items.count, dissector.items.count)
    assert_same(items.map{ |item| item.values.first }.sort, dissector.items.map{ |item| item.values.first }.sort)
  end
  
  def test_finds_items_tj_2
    dissector = ReceiptDissector.new(response_contents("tj_2"))
    items = [
      {"crispy crunchy mochi ric"=>"3.29"},
      {"peanut crunchy crispy co"=>"2.79"}
    ]
    dissector.parse_receipt
    assert_same(items.count, dissector.items.count)
    assert_same(items.map{ |item| item.values.first }.sort, dissector.items.map{ |item| item.values.first }.sort)
  end
  
  def test_finds_items_safeway_1
    dissector = ReceiptDissector.new(response_contents("safeway_1"))
    items = [
      {"spam"=>"7.66"},
      {"garam masala"=>"3.99"},
      {"o org whole tomato"=>"2.79"},
      {"radishes red bunch"=>"1.49"},
      {"clip top carrots"=>"0.57"},
      {"cilantro"=>"0.79"},
    ]
    dissector.parse_receipt
    assert_same(items.count, dissector.items.count)
    assert_same(items.map{ |item| item.values.first }.sort, dissector.items.map{ |item| item.values.first }.sort)
  end
  
  def test_finds_items_panda_express_1
    dissector = ReceiptDissector.new(response_contents("panda_express_1"))
    items = [
      {"plate"=>"10.00"},
      {"plate"=>"10.00"}
    ]
    dissector.parse_receipt
    assert_same(items.count, dissector.items.count)
    assert_same(items.map{ |item| item.values.first }.sort, dissector.items.map{ |item| item.values.first }.sort)
  end

  def response_contents(vendor)
    JSON.parse(File.read(File.join(__dir__,"../responses/#{vendor}.json")))
  end
end