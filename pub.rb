#require_relative()

class Pub

  attr_reader :name, :drinks, :till

  def initialize(name, drinks)
    @name   = name
    @drinks = drinks
    @till   = 0
  end

  def is_drink_available?(drink)
    return @drinks.include?(drink)
  end

  def yield_drink(drink)
    return @drinks.delete(drink)
  end

  def increase_till(price)
    return @till += price
  end


end
