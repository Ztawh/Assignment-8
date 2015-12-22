require_relative "ware"

class Daimstrut < Ware
    def self.price
        "$3.29"
    end

    def price
        self.class.price
    end

    def to_s
        "Daimstrut"
    end
end
