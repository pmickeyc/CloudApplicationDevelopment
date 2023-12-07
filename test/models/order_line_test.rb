# frozen_string_literal: true

require 'test_helper'

class OrderLineTest < ActiveSupport::TestCase
  def setup
    @order_line = order_lines(:one)
  end

  test 'should be valid' do
    assert @order_line.valid?
  end

  test 'quantity should be present' do
    @order_line.quantity = nil
    assert_not @order_line.valid?
  end

  test 'quantity should be greater than 0' do
    @order_line.quantity = 0
    assert_not @order_line.valid?
  end

  test 'quantity should be numeric' do
    @order_line.quantity = 'a'
    assert_not @order_line.valid?
  end

  test 'should belong to order' do
    assert_not_nil @order_line.order
  end

  test 'should belong to item' do
    assert_not_nil @order_line.item
  end
end
