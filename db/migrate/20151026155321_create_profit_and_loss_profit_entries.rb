class CreateProfitAndLossProfitEntries < ActiveRecord::Migration
  def change
    create_table :profit_and_loss_profit_entries do |t|
      t.string :name
      t.integer :ttc_price_in_cents
      t.text :information

      t.timestamps null: false
    end
  end
end
