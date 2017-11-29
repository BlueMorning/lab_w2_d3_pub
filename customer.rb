class Customer

  attr_reader :name, :wallet

  def initialize(name, wallet)
    @name   = name
    @wallet = wallet
  end

  def can_afford_item?(price)
    return @wallet >= price
  end

  def decrease_wallet(price)
    return @wallet -= price
  end

  def buy_drink(pub, drink)
    return if !(pub.is_drink_available?(drink))
    return if !(can_afford_item?(drink.price))
    pub.yield_drink(drink)
    decrease_wallet(drink.price)
    pub.increase_till(drink.price)
  end



end
