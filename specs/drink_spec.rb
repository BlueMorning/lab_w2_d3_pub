require("minitest/autorun")
require("minitest/rg")
require_relative("../drink")

class TestDrink < MiniTest::Test

  def setup
    @guinness = Drink.new("Guinness", 4)
    @white_wine = Drink.new("White wine", 3)
  end

  def test_drink_has_name
    expected = "Guinness"
    actual = @guinness.name
    assert_equal(expected, actual)
  end

end
