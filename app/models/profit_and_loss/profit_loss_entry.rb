module ProfitAndLoss
  class ProfitLossEntry < ActiveRecord::Base
    include DisplayablePrices

    belongs_to :report
    belongs_to :cost_entry
  end
end
