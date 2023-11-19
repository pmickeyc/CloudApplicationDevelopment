class OrderLine < ApplicationRecord
  belongs_to :order
  belongs_to :item  # Assuming there's an item association

  before_save :calculate_subtotal

  private

  def calculate_subtotal
    # Make sure item.price is not nil and quantity is present
    self.subtotal = (item.price || 0) * (quantity || 0)
  end
end
