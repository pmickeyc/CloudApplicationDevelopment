class OrderLine < ApplicationRecord
    belongs_to :order
  
    # You can include methods to calculate subtotal or other logic as needed
  end
  