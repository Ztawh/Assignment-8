require_relative "ware"

class BenAndJerry
    def self.price
        "$4.95"
    end

    def self.sell
        @sold = true
    end

    def to_s
        "BenAndJerry"
    end
end
