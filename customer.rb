class Customer

  attr_reader :name, :wallet, :age

  def initialize(name, wallet, age)
    @name   = name
    @wallet = wallet
    @age    = age
  end

  def can_afford_item?(price)
    return @wallet >= price
  end

  def decrease_wallet(price)
    return @wallet -= price
  end

  def buy_drink(pub, drink)
    return if !(pub.is_customer_above_legal_age?(self))
    return if !(pub.is_drink_available?(drink))
    return if !(can_afford_item?(drink.price))
    pub.yield_drink(drink)
    decrease_wallet(drink.price)
    pub.increase_till(drink.price)
  end



end
