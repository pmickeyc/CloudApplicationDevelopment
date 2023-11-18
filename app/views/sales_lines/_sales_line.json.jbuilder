json.extract! sales_line, :id, :item_name, :quantity, :discount_percentage, :tax_amount, :price_after_discount, :created_at, :updated_at
json.url sales_line_url(sales_line, format: :json)
