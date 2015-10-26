module ProfitAndLoss
  module DisplayablePrices

    def ttc_price
      (self.ttc_price_in_cents || 0) / 100.0
    end

    def ttc_price=(price)
      self.ttc_price_in_cents = (price.to_f * 100).to_i
    end

    def display_ttc_price
      "#{ttc_price} €"
    end
  end
end
