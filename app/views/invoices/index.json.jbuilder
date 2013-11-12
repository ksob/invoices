json.array!(@invoices) do |invoice|
  json.extract! invoice, :purchase_date, :issue_date, :payment_period, :invoice_number
  json.url invoice_url(invoice, format: :json)
end
