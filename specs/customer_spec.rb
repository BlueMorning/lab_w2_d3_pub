require("minitest/autorun")
require_relative("../pub")
require_relative("../drink")
require_relative("../food")
require_relative("../customer")

class TestCustomer < MiniTest::Test

  def setup

    @guinness   = Drink.new("Guinness", 4, 1)
    @white_wine = Drink.new("White wine", 3, 1)
    @red_wine   = Drink.new("Red wine", 3, 1)

    @drinks     = {@guinness.name    => {drink: @guinness,   quantity: 20},
                   @white_wine.name  => {drink: @white_wine, quantity: 100},
                   @red_wine.name    => {drink: @red_wine,   quantity: 0}
                  }

    @haggis           = Food.new("Haggis", 7, 1)
    @beef_bourguignon = Food.new("Beef bourguignon", 3, 5)
    @chips            = Food.new("Chips", 2, 1)

    @pub        = Pub.new("The black cat", @drinks)

    @eric       = Customer.new("Eric",50, 40)
    @dave       = Customer.new("Dave",1, 44)
    @justin     = Customer.new("Justin",1000, 16)

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

  def test_customer_has_age
    actual = 40
    expected = @eric.age
    assert_equal(expected, actual)
  end

  def test_customer_has_drunkenness_level
    actual = 0
    expected = @eric.drunkenness_level
    assert_equal(expected, actual)
  end

  def test_customer_can_afford_item__true
    expected = true
    actual = @eric.can_afford_item?(@guinness.price)
    assert_equal(expected, actual)
  end

  def test_customer_can_afford_item__false
    expected = false
    actual   = @dave.can_afford_item?(@guinness.price)
    assert_equal(expected, actual)
  end

  def test_decrease_wallet
    @eric.decrease_wallet(@guinness.price)
    expected = 46
    actual   = @eric.wallet
    assert_equal(expected, actual)
  end

  def test_increase_drunkenness_level
    @eric.increase_drunkenness_level(@guinness)
    expected = 1
    actual   = @eric.drunkenness_level
    assert_equal(expected, actual)
  end

  def test_decrease_drunkenness_level
    @pub.serve_drink(@eric, @guinness)
    @pub.serve_drink(@eric, @white_wine)
    @eric.decrease_drunkenness_level(@haggis)
    expected = 1
    actual = @eric.drunkenness_level
    assert_equal(expected, actual)
  end


end
