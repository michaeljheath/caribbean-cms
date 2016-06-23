class Destination < ActiveRecord::Base
  belongs_to :country
  has_many :accommodations
end
