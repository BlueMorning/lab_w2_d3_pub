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

  end

  def test_customer_has_name
    actual = "Eric"
    expected = @eric.name
    assert_equal(expected, actual)
  end

  def test_has_has_wallet
    actual = 50
    expected = @eric.wallet
    assert_equal(expected, actual)
  end

end
