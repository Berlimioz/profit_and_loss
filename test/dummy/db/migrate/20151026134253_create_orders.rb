class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :name
      t.integer :price_in_cents
      t.integer :profit_in_cents

      t.timestamps null: false
    end
  end
end
