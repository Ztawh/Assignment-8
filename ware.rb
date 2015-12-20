class Ware
  # This method should be overriden in subclasses
  def self.price
    "No price"
  end

  def self.sell
    @sold = true
  end
end
