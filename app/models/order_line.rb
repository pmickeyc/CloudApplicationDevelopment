class OrderLine < ApplicationRecord
  belongs_to :order
  belongs_to :item  # Assuming there's an item association

  validates :quantity, presence: true, numericality: { greater_than: 0 }
  validates_associated :item

  before_save :calculate_subtotal
  
  validate :item_name_present

  private

  def item_name_present
    errors.add(:item, "must have a name") if item && item.name.blank?
  end

  def calculate_subtotal
    # Make sure item.price is not nil and quantity is present
    self.subtotal = (item.price || 0) * (quantity || 0)
  end
end
