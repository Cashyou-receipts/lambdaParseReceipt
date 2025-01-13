class TestTester < TestObject
  def test_zero_equals_zero
    expect_same(0, 0, "Zero and zero are the same")
  end

  def test_one_equals_zero
    expect_same(1, 0, "One and zero are the same")
  end

  def test_this_is_true
    assert 1 + 1 == 2
  end

  def test_this_is_false
    assert 1 + 1 == 4
  end
end