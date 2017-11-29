require("minitest/autorun")
require("minitest/rg")
require_relative("../drink")

class TestDrink < MiniTest::Test

  def setup
    @guinness = Drink.new("Guinness", 4, 1)
    @white_wine = Drink.new("White wine", 3, 1)
  end

  def test_drink_has_name
    expected = "Guinness"
    actual = @guinness.name
    assert_equal(expected, actual)
  end

  def test_drink_has_price
    expected = 4
    actual = @guinness.price
    assert_equal(expected, actual)
  end

  def test_has_alcohol_level
    expected = 1
    actual = @guinness.alcohol_level
    assert_equal(expected, actual)
  end

end
