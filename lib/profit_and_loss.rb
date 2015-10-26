require "profit_and_loss/engine"

module ProfitAndLoss
  mattr_accessor :profit_class
  mattr_accessor :profit_ttc_price_in_cents_column
  mattr_accessor :profit_ttc_price_in_cents_method
  mattr_accessor :profit_date_method

end
