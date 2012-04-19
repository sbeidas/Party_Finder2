	class Party < ActiveRecord::Base
	belongs_to :location
	belongs_to:user

def location_address
  location.address if location
end
def location_address=(address)
  self.location= Location.find_or_create_by_address(address) unless address.blank?
end

def user_fbId
  user.fbId if user
end
def user_fbId=(fbId)
  self.user= User.find_or_create_by_fbId(fbId) unless fbId.blank?
end

end
