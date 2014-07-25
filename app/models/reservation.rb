class Reservation < ActiveRecord::Base
	belongs_to :restaurant
	validates :restaurant_id, presence: true
end
