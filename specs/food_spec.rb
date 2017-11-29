require("minitest/autorun")
require("minitest/rg")
require_relative("../food")

class TestFood < MiniTest::Test

  def setup
    @haggis = Food.new("Haggis", 4, 1)
    @beef_bourguignon = Food.new("Beef bourguignon", 3, 5)
  end

  def test_food_has_name
    expected = "Haggis"
    actual = @haggis.name
    assert_equal(expected, actual)
  end

  def test_food_has_price
    expected = 4
    actual = @haggis.price
    assert_equal(expected, actual)
  end

  def test_food_has_rejuvenation_level
    expected = 1
    actual = @haggis.rejuvenation_level
    assert_equal(expected, actual)
  end

end
