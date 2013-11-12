json.array!(@invoice_notes) do |invoice_note|
  json.extract! invoice_note, :content, :user_id, :invoice_id
  json.url invoice_note_url(invoice_note, format: :json)
end
