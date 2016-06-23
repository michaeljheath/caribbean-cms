json.array!(@destinations) do |destination|
  json.extract! destination, :id, :country_id, :name, :destinationId
  json.url destination_url(destination, format: :json)
end
