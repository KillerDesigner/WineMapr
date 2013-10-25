class Winery < ActiveRecord::Base
  attr_accessible :address_1, :address_2, :address_3, :city, :email, :lat, :lon, :phone_1, :phone_2, :phone_fax, :postal_code, :state, :website_url, :winery_name
end
