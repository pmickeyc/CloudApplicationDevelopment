class Order < ApplicationRecord
    has_many :order_lines, dependent: :destroy
  
    # Callback to update total amount before saving
    before_save :update_total_amount

    private
    def update_total_amount
      self.total_amount = order_lines.sum(&:subtotal)
    end
  end
  