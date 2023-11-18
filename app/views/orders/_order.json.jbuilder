json.extract! order, :id, :transaction_date, :total_amount, :total_tax, :created_at, :updated_at
json.url order_url(order, format: :json)
