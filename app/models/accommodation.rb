class Accommodation < ActiveRecord::Base

  belongs_to :destination
  belongs_to :accommodation_category
  #belongs_to :customer
  belongs_to :country

end
