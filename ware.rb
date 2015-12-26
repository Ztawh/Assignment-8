class Ware
  # This method should be overriden in subclasses
  def self.price
    "No price"
  end

  def price
    self.class.price
  end

  def sell()
    @sold = true
  end

  def is_sold?
    @sold
  end
end
