module ProfitAndLoss
  class ProfitEntry < ActiveRecord::Base
    include DisplayablePrices
  end
end
