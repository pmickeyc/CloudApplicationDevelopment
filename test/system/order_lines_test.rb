# frozen_string_literal: true

require 'application_system_test_case'

class OrderLinesTest < ApplicationSystemTestCase
  setup do
    @order_line = order_lines(:one)
  end

  test 'visiting the index' do
    visit order_lines_url
    assert_selector 'h1', text: 'Order lines'
  end

  test 'should create order line' do
    visit order_lines_url
    click_on 'New order line'

    fill_in 'Discount percentage', with: @order_line.discount_percentage
    fill_in 'Item', with: @order_line.item
    fill_in 'Price after discount', with: @order_line.price_after_discount
    fill_in 'Quantity', with: @order_line.quantity
    fill_in 'Tax amount', with: @order_line.tax_amount
    click_on 'Create Order line'

    assert_text 'Order line was successfully created'
    click_on 'Back'
  end

  test 'should update Order line' do
    visit order_line_url(@order_line)
    click_on 'Edit this order line', match: :first

    fill_in 'Discount percentage', with: @order_line.discount_percentage
    fill_in 'Item', with: @order_line.item
    fill_in 'Price after discount', with: @order_line.price_after_discount
    fill_in 'Quantity', with: @order_line.quantity
    fill_in 'Tax amount', with: @order_line.tax_amount
    click_on 'Update Order line'

    assert_text 'Order line was successfully updated'
    click_on 'Back'
  end

  test 'should destroy Order line' do
    visit order_line_url(@order_line)
    click_on 'Destroy this order line', match: :first

    assert_text 'Order line was successfully destroyed'
  end
end
