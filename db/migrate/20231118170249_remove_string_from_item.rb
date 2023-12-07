# frozen_string_literal: true

class RemoveStringFromItem < ActiveRecord::Migration[7.0]
  def change
    remove_column :items, :string, :string
  end
end
