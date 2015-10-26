class CreateReports < ActiveRecord::Migration
  def change
    create_table :profit_and_loss_reports do |t|
      t.date :from_date
      t.date :to_date
      t.string :name

      t.timestamps
    end

    create_table :profit_and_loss_profit_loss_entries do |t|
      t.integer :report_id
      t.integer :cost_entry_id
      t.integer :profit_entry_id
      t.boolean :profit, default: false
      t.string :name
      t.integer :ttc_price_in_cents

      t.timestamps
    end
  end
end
