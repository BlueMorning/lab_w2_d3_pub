require("minitest/autorun")
require("minitest/rg")
require_relative("../pub")
require_relative("../drink")


class TestPub < MiniTest::Test

  def setup

    @guinness   = Drink.new("Guinness", 4)
    @white_wine = Drink.new("White wine", 3)
    @red_wine   = Drink.new("Red wine", 3)
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

  def test_pub_has_till
    expected  = 0
    actual    = @pub.till
    assert_equal(expected, actual)
  end

  def test_is_drink_available__true
    expected = true
    actual = @pub.is_drink_available?(@guinness)
    assert_equal(expected, actual)
  end

  def test_is_drink_available__false
    expected = false
    actual = @pub.is_drink_available?(@red_wine)
    assert_equal(expected, actual)
  end

  def test_yield_drink
    @pub.yield_drink(@guinness)
    expected = false
    actual = @pub.is_drink_available?(@guinness)
    assert_equal(expected, actual)
  end

  def test_increase_till
    @pub.increase_till(@guinness.price)
    expected = 4
    actual = @pub.till
    assert_equal(expected, actual)
  end

end
