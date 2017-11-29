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

end
