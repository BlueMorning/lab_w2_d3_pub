require("minitest/autorun")
require("minitest/rg")
require_relative("../pub")
require_relative("../drink")
require_relative("../customer")

class TestCustomer < MiniTest::Test

  def setup

    @guinness   = Drink.new("Guinness", 4)
    @white_wine = Drink.new("White wine", 3)
    @drinks     = [@guinness, @white_wine]

    @pub        = Pub.new("The black cat", @drinks)

    @eric       = Customer.new("Eric",50)
    @dave       = Customer.new("Dave",1)

  end

  def test_customer_has_name
    actual = "Eric"
    expected = @eric.name
    assert_equal(expected, actual)
  end

  def test_customer_has_wallet
    actual = 50
    expected = @eric.wallet
    assert_equal(expected, actual)
  end

  def test_customer_can_afford_item__true
    expected = true
    actual = @eric.can_afford_item?(@guinness.price)
    assert_equal(expected, actual)

  end

  def test_customer_can_afford_item__false
    expected = false
    actual = @dave.can_afford_item?(@guinness.price)
    assert_equal(expected, actual)
  end

  def test_decrease_wallet
    @eric.decrease_wallet(@guinness.price)
    expected = 46
    actual = @eric.wallet
    assert_equal(expected, actual)
  end

  def test_buy_drink__successful
    assert_equal(true, @pub.is_drink_available?(@guinness))
    assert_equal(true, @eric.can_afford_item?(@guinness.price))
    @eric.buy_drink(@pub, @guinness)
    assert_equal(false, @pub.is_drink_available?(@guinness))
    assert_equal(46, @eric.wallet)
    assert_equal(4, @pub.till)
  end

  def test_buy_drink__failed_drink_not_available
    assert_equal(false, @pub.is_drink_available?(@red_wine))
    @eric.buy_drink(@pub, @red_wine)
    assert_equal(false, @pub.is_drink_available?(@red_wine))
    assert_equal(50, @eric.wallet)
    assert_equal(0, @pub.till)
  end

  def test_buy_drink__failed_customer_not_solvent
    assert_equal(false, @dave.can_afford_item?(@guinness.price))
    @dave.buy_drink(@pub, @guiness)
    assert_equal(false, @dave.can_afford_item?(@guinness.price))
    assert_equal(1, @dave.wallet)
    assert_equal(0, @pub.till)
  end



end
