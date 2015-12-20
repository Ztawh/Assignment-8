require_relative "ware"

class Daimstrut < Ware
    def self.price
        "$3.29"
    end

    def self.sell
        @sold = true
    end

    def to_s
        "Daimstrut"
    end
end
