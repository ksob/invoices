json.array!(@users) do |user|
  json.extract! user, :name, :zip_code, :city, :nip
  json.url user_url(user, format: :json)
end
