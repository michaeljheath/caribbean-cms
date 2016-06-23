json.array!(@accommodation_categories) do |accommodation_category|
  json.extract! accommodation_category, :id, :name
  json.url accommodation_category_url(accommodation_category, format: :json)
end
