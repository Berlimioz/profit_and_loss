class AddColumnsToCostEntries < ActiveRecord::Migration
  def change
    add_column :profit_and_loss_cost_entries, :ttc_price_in_cents, :integer
    add_column :profit_and_loss_cost_entries, :source, :string
    add_column :profit_and_loss_cost_entries, :recurrence_type, :string
  end
end
