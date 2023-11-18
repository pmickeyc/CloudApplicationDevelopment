class CreateSalesLines < ActiveRecord::Migration[7.0]
  def change
    create_table :sales_lines do |t|
      t.string :item_name
      t.integer :quantity
      t.decimal :discount_percentage
      t.decimal :tax_amount
      t.decimal :price_after_discount

      t.timestamps
    end
  end
end
