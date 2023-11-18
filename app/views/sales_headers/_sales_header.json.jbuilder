json.extract! sales_header, :id, :transaction_date, :total_amount, :total_tax, :created_at, :updated_at
json.url sales_header_url(sales_header, format: :json)
