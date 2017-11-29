require("minitest/autorun")
require("minitest/rg")
require_relative("../pub")
require_relative("../drink")
require_relative("../customer")

class TestCustomer < MiniTest::Test

  def setup

    @guinness   = Drink.new("Guinness", 4, 1)
    @white_wine = Drink.new("White wine", 3, 1)
    @drinks     = [@guinness, @white_wine]

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
    actual = @dave.can_afford_item?(@guinness.price)
    assert_equal(expected, actual)
  end

  def test_decrease_wallet
    @eric.decrease_wallet(@guinness.price)
    expected = 46
    actual = @eric.wallet
    assert_equal(expected, actual)
  end

  def test_increase_drunkenness_level
    @eric.increase_drunkenness_level(@guinness)
    expected = 1
    actual = @eric.drunkenness_level
    assert_equal(expected, actual)
  end


end
