json.array!(@invoice_items) do |invoice_item|
  json.extract! invoice_item, :price, :name, :invoice_id
  json.url invoice_item_url(invoice_item, format: :json)
end
