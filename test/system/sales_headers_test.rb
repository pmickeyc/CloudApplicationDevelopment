require "application_system_test_case"

class SalesHeadersTest < ApplicationSystemTestCase
  setup do
    @sales_header = sales_headers(:one)
  end

  test "visiting the index" do
    visit sales_headers_url
    assert_selector "h1", text: "Sales headers"
  end

  test "should create sales header" do
    visit sales_headers_url
    click_on "New sales header"

    fill_in "Total amount", with: @sales_header.total_amount
    fill_in "Total tax", with: @sales_header.total_tax
    fill_in "Transaction date", with: @sales_header.transaction_date
    click_on "Create Sales header"

    assert_text "Sales header was successfully created"
    click_on "Back"
  end

  test "should update Sales header" do
    visit sales_header_url(@sales_header)
    click_on "Edit this sales header", match: :first

    fill_in "Total amount", with: @sales_header.total_amount
    fill_in "Total tax", with: @sales_header.total_tax
    fill_in "Transaction date", with: @sales_header.transaction_date
    click_on "Update Sales header"

    assert_text "Sales header was successfully updated"
    click_on "Back"
  end

  test "should destroy Sales header" do
    visit sales_header_url(@sales_header)
    click_on "Destroy this sales header", match: :first

    assert_text "Sales header was successfully destroyed"
  end
end
