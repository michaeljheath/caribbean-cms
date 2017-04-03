class Destination < ActiveRecord::Base
  self.table_name = "destination"
  self.primary_key = 'destination_id'

  belongs_to :country
  has_many :locations
end
