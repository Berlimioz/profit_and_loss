class CreateProfitAndLossCostEntries < ActiveRecord::Migration
  def change
    create_table :profit_and_loss_cost_entries do |t|
      t.string :name
      t.text :information

      t.timestamps null: false
    end
  end
end
