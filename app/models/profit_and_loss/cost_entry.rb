module ProfitAndLoss
  class CostEntry < ActiveRecord::Base
    include DisplayablePrices
    has_many :comments

  end
end
