class CreateProfitAndLossComments < ActiveRecord::Migration
  def change
    create_table :profit_and_loss_comments do |t|
      t.integer :cost_entry_id
      t.text :text

      t.timestamps null: false
    end
  end
end
