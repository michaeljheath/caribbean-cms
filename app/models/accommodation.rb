class Accommodation < ActiveRecord::Base

  self.table_name = "accommodation"
  self.primary_key = 'accommodation_id'

  belongs_to :location
  belongs_to :accommodation_category
  #belongs_to :customer
  #belongs_to :country

  has_attached_file :photo,
                    :path => "#{Rails.root}/public/photo_attachment/:id/:style/:basename.:extension",
                    :url => "/photo_attachment/:id/:style/:basename.:extension",
                    styles: { thumb: ["300x300#", :jpg] }

  validates_attachment :photo,
                       content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }

end
