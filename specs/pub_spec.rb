require("minitest/autorun")
require("minitest/rg")
require_relative("../pub")
require_relative("../drink")


class TestPub < MiniTest::Test

  def setup

    @guinness   = Drink.new("Guinness", 4)
    @white_wine = Drink.new("White wine", 3)
    @drinks     = [@guinness, @white_wine]

    @pub        = Pub.new("The black cat", @drinks)

  end

  def test_pub_has_name
    expected  = "The black cat"
    actual    = @pub.name
    assert_equal(expected, actual)
  end

  def test_pub_has_drinks
    expected  = @drinks
    actual    = @pub.drinks
    assert_equal(expected, actual)
  end


end
