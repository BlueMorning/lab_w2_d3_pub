class Customer

  attr_reader :name, :wallet

  def initialize(name, wallet)
    @name   = name
    @wallet = wallet
  end

def can_afford_drink?(drink)
    return @wallet >= drink.price
end



end
