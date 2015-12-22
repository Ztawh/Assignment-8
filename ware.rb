class Ware
  # This method should be overriden in subclasses
  def self.price
    "No price"
  end

  def price
    self.class.price
  end
end
