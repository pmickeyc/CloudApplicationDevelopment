class Item < ApplicationRecord
    has_many :order_lines

    validates :name, presence: true, uniqueness: true
    validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
    validates :tax_rate, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }
    validates :description, length: { maximum: 500 }, allow_blank: true
end
