	class Party < ActiveRecord::Base
	belongs_to :location

def location_address
  location.address if location
end
def location_address=(address)
  self.location= Location.find_or_create_by_address(address) unless address.blank?
end

end
