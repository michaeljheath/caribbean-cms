class Accommodation < ActiveRecord::Base

  self.table_name = "accommodation"
  self.primary_key = 'accommodation_id'

  belongs_to :location
  belongs_to :accommodation_category
  #belongs_to :customer
  #belongs_to :country

end
