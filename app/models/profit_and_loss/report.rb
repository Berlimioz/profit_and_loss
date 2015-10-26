module ProfitAndLoss
  class Report < ActiveRecord::Base
    has_many :profit_loss_entries

    accepts_nested_attributes_for :profit_loss_entries, reject_if: proc {|attributes| attributes['cost_entry_id'].blank? && attributes['profit_entry_id'].blank?}

    def loss_entries
      profit_loss_entries.where.not(cost_entry_id: nil).where.not(ttc_price_in_cents: nil)
    end

    def profit_entries
      profit_loss_entries.where.not(profit_entry_id: nil).where.not(ttc_price_in_cents: nil)
    end

    def profit_objects
      ProfitAndLoss.profit_class.constantize.where.not(ProfitAndLoss.profit_ttc_price_in_cents_method => nil).where("#{ProfitAndLoss.profit_date_method} >= ? AND #{ProfitAndLoss.profit_date_method} < ?", from_date, to_date)
    end

    def profit_objects_total
      profit_objects.pluck(ProfitAndLoss.profit_ttc_price_in_cents_column).sum / 100.0
    end

    def profit_total
      profit_objects_total + profit_entries.pluck(:ttc_price_in_cents).sum / 100.0
    end

    def loss_total
      loss_entries.pluck(:ttc_price_in_cents).sum / 100.0
    end

    def total_result
      profit_total - loss_total
    end

    def init_profit_loss_entries
      CostEntry.all.each do |cost_entry|
        profit_loss_entries.find_or_initialize_by(name: cost_entry.name, ttc_price_in_cents: cost_entry.ttc_price_in_cents, cost_entry_id: cost_entry.id)
      end
      ProfitEntry.all.each do |profit_entry|
        profit_loss_entries.find_or_initialize_by(name: profit_entry.name, ttc_price_in_cents: profit_entry.ttc_price_in_cents, profit_entry_id: profit_entry.id)
      end
    end

  end
end
