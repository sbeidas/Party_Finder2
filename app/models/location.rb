class Location < ActiveRecord::Base
	
	has_many :parties
  attr_accessible :address, :latitude, :longitude
geocoded_by :address
after_validation :geocode, :if => :address_changed?
end
