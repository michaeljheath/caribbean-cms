json.array!(@accommodations) do |accommodation|
  json.extract! accommodation, :id, :destination_id, :accommodation_category_id, :name, :price, :telephone, :fax, :address, :email, :web_address, :details, :description, :has_beach, :has_casino, :is_all_inclusive, :is_family_friendly, :show_email, :show_web_address, :show_listings, :qualification_level, :modified_at, :customer_id, :num_photos, :has_internet, :is_near_golf_course, :has_logo, :admin_contact, :admin_email, :admin_phone, :hotel_url, :affiliate_url, :country_id
  json.url accommodation_url(accommodation, format: :json)
end
