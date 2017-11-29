#require_relative()

class Pub

  attr_reader :name, :drinks, :till, :legal_age

  def initialize(name, drinks, legal_age = 18)
    @name   = name
    @drinks = drinks
    @till   = 0
    @legal_age = legal_age
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

  def is_customer_above_legal_age?(customer)
    return customer.age >= @legal_age
  end


end
