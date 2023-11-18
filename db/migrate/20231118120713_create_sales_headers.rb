class CreateSalesHeaders < ActiveRecord::Migration[7.0]
  def change
    create_table :sales_headers do |t|
      t.date :transaction_date
      t.decimal :total_amount
      t.decimal :total_tax

      t.timestamps
    end
  end
end
