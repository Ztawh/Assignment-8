require_relative "ware"

class BenAndJerry < Ware
    def self.price
        "$4.95"
    end

    def price
        self.class.price
    end

    def to_s
        "BenAndJerry"
    end
end
