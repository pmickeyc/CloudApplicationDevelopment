# frozen_string_literal: true

class AddOrderIdToOrderLines < ActiveRecord::Migration[7.0]
  def change
    add_reference :order_lines, :order, null: false, foreign_key: true
  end
end
