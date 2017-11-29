class Customer

  attr_reader :name, :wallet, :age, :drunkenness_level

  def initialize(name, wallet, age)
    @name   = name
    @wallet = wallet
    @age    = age
    @drunkenness_level = 0
  end

  def can_afford_item?(price)
    return @wallet >= price
  end

  def decrease_wallet(price)
    return @wallet -= price
  end

end
