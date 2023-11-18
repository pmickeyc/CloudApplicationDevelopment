require "test_helper"

class SalesLinesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sales_line = sales_lines(:one)
  end

  test "should get index" do
    get sales_lines_url
    assert_response :success
  end

  test "should get new" do
    get new_sales_line_url
    assert_response :success
  end

  test "should create sales_line" do
    assert_difference("SalesLine.count") do
      post sales_lines_url, params: { sales_line: { discount_percentage: @sales_line.discount_percentage, item_name: @sales_line.item_name, price_after_discount: @sales_line.price_after_discount, quantity: @sales_line.quantity, tax_amount: @sales_line.tax_amount } }
    end

    assert_redirected_to sales_line_url(SalesLine.last)
  end

  test "should show sales_line" do
    get sales_line_url(@sales_line)
    assert_response :success
  end

  test "should get edit" do
    get edit_sales_line_url(@sales_line)
    assert_response :success
  end

  test "should update sales_line" do
    patch sales_line_url(@sales_line), params: { sales_line: { discount_percentage: @sales_line.discount_percentage, item_name: @sales_line.item_name, price_after_discount: @sales_line.price_after_discount, quantity: @sales_line.quantity, tax_amount: @sales_line.tax_amount } }
    assert_redirected_to sales_line_url(@sales_line)
  end

  test "should destroy sales_line" do
    assert_difference("SalesLine.count", -1) do
      delete sales_line_url(@sales_line)
    end

    assert_redirected_to sales_lines_url
  end
end
