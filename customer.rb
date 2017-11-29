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

  def increase_drunkenness_level(drink)
    return @drunkenness_level += drink.alcohol_level
  end

  def decrease_drunkenness_level(food)
    @drunkenness_level -= food.rejuvenation_level
    @drunkenness_level = 0 if @drunkenness_level < 0
    return @drunkenness_level
  end

end
