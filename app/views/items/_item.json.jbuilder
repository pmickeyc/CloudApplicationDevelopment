json.extract! item, :id, :\name, :\price, :\tax_rate, :\description, :string, :created_at, :updated_at
json.url item_url(item, format: :json)
