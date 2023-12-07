# frozen_string_literal: true

require 'test_helper'

class ItemTest < ActiveSupport::TestCase
  def setup
    @item = items(:one)
  end

  test 'should be valid' do
    assert @item.valid?
  end

  test 'name should be present' do
    @item.name = nil
    assert_not @item.valid?
  end

  test 'name should be unique' do
    duplicate_item = @item.dup
    duplicate_item.name = @item.name
    @item.save
    assert_not duplicate_item.valid?
  end

  test 'price should be present' do
    @item.price = nil
    assert_not @item.valid?
  end

  test 'price should be a positive number' do
    @item.price = -10
    assert_not @item.valid?
  end

  test 'tax_rate should be a number between 0 and 100' do
    @item.tax_rate = -5
    assert_not @item.valid?
    @item.tax_rate = 105
    assert_not @item.valid?
  end

  test 'description can be blank' do
    @item.description = ''
    assert @item.valid?
  end

  test 'description should not be too long' do
    @item.description = 'a' * 501
    assert_not @item.valid?
  end

  test 'price should be numeric' do
    @item.price = 'not-a-number'
    assert_not @item.valid?, 'Item is valid with a non-numeric price'
  end

  test 'tax_rate should be numeric' do
    @item.tax_rate = 'not-a-number'
    assert_not @item.valid?, 'Item is valid with a non-numeric tax_rate'
  end
end
