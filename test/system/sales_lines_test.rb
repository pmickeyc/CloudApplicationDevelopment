require "application_system_test_case"

class SalesLinesTest < ApplicationSystemTestCase
  setup do
    @sales_line = sales_lines(:one)
  end

  test "visiting the index" do
    visit sales_lines_url
    assert_selector "h1", text: "Sales lines"
  end

  test "should create sales line" do
    visit sales_lines_url
    click_on "New sales line"

    fill_in "Discount percentage", with: @sales_line.discount_percentage
    fill_in "Item name", with: @sales_line.item_name
    fill_in "Price after discount", with: @sales_line.price_after_discount
    fill_in "Quantity", with: @sales_line.quantity
    fill_in "Tax amount", with: @sales_line.tax_amount
    click_on "Create Sales line"

    assert_text "Sales line was successfully created"
    click_on "Back"
  end

  test "should update Sales line" do
    visit sales_line_url(@sales_line)
    click_on "Edit this sales line", match: :first

    fill_in "Discount percentage", with: @sales_line.discount_percentage
    fill_in "Item name", with: @sales_line.item_name
    fill_in "Price after discount", with: @sales_line.price_after_discount
    fill_in "Quantity", with: @sales_line.quantity
    fill_in "Tax amount", with: @sales_line.tax_amount
    click_on "Update Sales line"

    assert_text "Sales line was successfully updated"
    click_on "Back"
  end

  test "should destroy Sales line" do
    visit sales_line_url(@sales_line)
    click_on "Destroy this sales line", match: :first

    assert_text "Sales line was successfully destroyed"
  end
end
