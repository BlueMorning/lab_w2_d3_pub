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




end
