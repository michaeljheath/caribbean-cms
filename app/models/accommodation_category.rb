class AccommodationCategory < ActiveRecord::Base
  self.table_name = "accommodation_category"
  has_many :accommodations
end
