class Order < ApplicationRecord
    has_many :order_lines, dependent: :destroy
    accepts_nested_attributes_for :order_lines, 
                                allow_destroy: true
  
    # Callback to update total amount before saving
    before_save :update_total_amount

    private
    def update_total_amount
      self.total_amount = order_lines.sum(&:subtotal)
    end
  end
  