json.array!(@clients) do |client|
  json.extract! client, :name, :street, :zip_code, :city, :nip
  json.url client_url(client, format: :json)
end
