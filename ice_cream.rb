# We need to import (require) the Ware class since we subclass it here
require_relative "ware"

class IceCream < Ware
  # Overriden method from the superclass
  def self.price
    "$2.95"
  end

  def self.sell
    @sold = true
  end

  def to_s
    "IceCream"
  end
end
