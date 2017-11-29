require("minitest/autorun")
require("minitest/rg")
require_relative("../pub")
require_relative("../drink")
require_relative("../customer")


class TestPub < MiniTest::Test

  def setup

    @guinness   = Drink.new("Guinness", 4, 1)
    @white_wine = Drink.new("White wine", 3, 1)
    @red_wine   = Drink.new("Red wine", 3, 1)
    @drinks     = [@guinness, @white_wine]

    @eric       = Customer.new("Eric",50, 40)
    @dave       = Customer.new("Dave",1, 44)
    @justin     = Customer.new("Justin",1000, 16)

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

  def test_pub_has_leagal_age
    expected = 18
    actual = @pub.legal_age
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

  def test_serve_drink__successful
    assert_equal(true, @pub.is_drink_available?(@guinness))
    assert_equal(true, @eric.can_afford_item?(@guinness.price))
    assert_equal(true, @pub.is_customer_above_legal_age?(@eric))
    @pub.serve_drink(@eric, @guinness)
    assert_equal(false, @pub.is_drink_available?(@guinness))
    assert_equal(46, @eric.wallet)
    assert_equal(4, @pub.till)
  end

  def test_serve_drink__failed_drink_not_available
    assert_equal(false, @pub.is_drink_available?(@red_wine))
    @pub.serve_drink(@eric, @red_wine)
    assert_equal(50, @eric.wallet)
    assert_equal(0, @pub.till)
  end

  def test_serve_drink__failed_customer_not_solvent
    assert_equal(false, @dave.can_afford_item?(@guinness.price))
    @pub.serve_drink(@dave, @guinness)
    assert_equal(1, @dave.wallet)
    assert_equal(0, @pub.till)
  end

  def test_serve_drink__failed_customer_not_old_enough
    assert_equal(false, @pub.is_customer_above_legal_age?(@justin))
    @pub.serve_drink(@justin, @guinness)
    assert_equal(1000, @justin.wallet)
    assert_equal(0, @pub.till)
  end

  def test_is_customer_above_legal_age__true
    expected = true
    actual = @pub.is_customer_above_legal_age?(@eric)
    assert_equal(expected, actual)
  end

  def test_is_customer_above_legal_age__false
    expected = false
    actual = @pub.is_customer_above_legal_age?(@justin)
    assert_equal(expected, actual)
  end

end
