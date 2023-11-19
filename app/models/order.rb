class Order < ApplicationRecord
  has_many :order_lines, dependent: :destroy
  accepts_nested_attributes_for :order_lines, allow_destroy: true

  before_save :calculate_total_amount
  after_save :update_total_amount

  def calculate_total_amount
    subtotals = order_lines.map do |line|
      subtotal = line.subtotal.to_f  # Convert nil to 0.0
      puts "Subtotal for #{line.item.name}: #{subtotal}"  # Print each subtotal
      subtotal
    end
  
    calculated_total = subtotals.sum
    puts "Calculated total amount: #{calculated_total}"  # Debugging line
  
    self.total_amount = calculated_total
  end

  def update_total_amount
    update_columns(total_amount: calculate_total_amount)
  end
  
end
