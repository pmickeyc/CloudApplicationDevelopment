# frozen_string_literal: true

json.extract! order_line, :id, :item, :quantity, :discount_percentage, :tax_amount, :price_after_discount, :created_at,
              :updated_at
json.url order_line_url(order_line, format: :json)
