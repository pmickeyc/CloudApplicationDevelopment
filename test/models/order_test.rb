# frozen_string_literal: true

require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  def setup
    @order = orders(:one)
    @order_line = OrderLine.new(order: @order, quantity: 10)
  end

  test 'quantity should be present' do
    order_line = OrderLine.new(order: @order, quantity: nil)
    assert_not order_line.valid?
  end

  test 'should be valid' do
    assert @order.valid?
  end

  test 'transaction_date should be present' do
    @order.transaction_date = nil
    assert_not @order.valid?
  end

  test 'should have order lines' do
    assert_not @order.order_lines.empty?
  end
end
