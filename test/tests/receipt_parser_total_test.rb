require_relative 'test_helper'
require_relative 'test_object'

class ReceiptParserTotalTest < TestObject
  def test_finds_total_costco_1
    receipt = response_contents("costco_1")
    parser = ReceiptDissector.new(receipt)
    assert_same(160.23, parser.identify_total, "costco_1")
  end

  def test_finds_total_dsw
    receipt = response_contents("dsw")
    parser = ReceiptDissector.new(receipt)
    assert_same(97.30, parser.identify_total, "dsw")
  end

  def test_finds_total_panda_express_1
    receipt = response_contents("panda_express_1")
    parser = ReceiptDissector.new(receipt)
    assert_same(21.84, parser.identify_total, "panda_express_1")
  end

  def test_finds_total_soops_1
    receipt = response_contents("soops_1")
    parser = ReceiptDissector.new(receipt)
    assert_same(5.99, parser.identify_total, "soops_1")
  end

  def test_finds_total_soops_4
    receipt = response_contents("soops_4")
    parser = ReceiptDissector.new(receipt)
    assert_same(11.82, parser.identify_total, "soops_4")
  end

  def test_finds_total_tj_1
    receipt = response_contents("tj_1")
    parser = ReceiptDissector.new(receipt)
    assert_same(19.50, parser.identify_total, "tj_1")
  end

  def response_contents(vendor)
    JSON.parse(File.read(File.join(__dir__,"../responses/#{vendor}.json")))
  end
end
