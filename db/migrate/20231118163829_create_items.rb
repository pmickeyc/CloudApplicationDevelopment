# frozen_string_literal: true

class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :name
      t.decimal :price
      t.decimal :tax_rate
      t.string :description
      t.string :string

      t.timestamps
    end
  end
end
