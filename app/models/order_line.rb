class OrderLine < ApplicationRecord
    belongs_to :order
    belongs_to :item
  
    # You can include methods to calculate subtotal or other logic as needed
    before_save :calculate_subtotal

    private
  
    def calculate_subtotal
      item = Item.find(item_id)
      self.subtotal = item.price * quantity
      # Add additional calculations for tax, etc., if needed
    end
  end
  