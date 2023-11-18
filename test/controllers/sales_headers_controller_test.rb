require "test_helper"

class SalesHeadersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sales_header = sales_headers(:one)
  end

  test "should get index" do
    get sales_headers_url
    assert_response :success
  end

  test "should get new" do
    get new_sales_header_url
    assert_response :success
  end

  test "should create sales_header" do
    assert_difference("SalesHeader.count") do
      post sales_headers_url, params: { sales_header: { total_amount: @sales_header.total_amount, total_tax: @sales_header.total_tax, transaction_date: @sales_header.transaction_date } }
    end

    assert_redirected_to sales_header_url(SalesHeader.last)
  end

  test "should show sales_header" do
    get sales_header_url(@sales_header)
    assert_response :success
  end

  test "should get edit" do
    get edit_sales_header_url(@sales_header)
    assert_response :success
  end

  test "should update sales_header" do
    patch sales_header_url(@sales_header), params: { sales_header: { total_amount: @sales_header.total_amount, total_tax: @sales_header.total_tax, transaction_date: @sales_header.transaction_date } }
    assert_redirected_to sales_header_url(@sales_header)
  end

  test "should destroy sales_header" do
    assert_difference("SalesHeader.count", -1) do
      delete sales_header_url(@sales_header)
    end

    assert_redirected_to sales_headers_url
  end
end
