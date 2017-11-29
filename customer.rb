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



end
