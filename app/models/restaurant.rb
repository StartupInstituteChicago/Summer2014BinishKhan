class Restaurant < ActiveRecord::Base
	belongs_to :user
	has_many :reservations, :dependent => :destroy
	accepts_nested_attributes_for :reservations, :reject_if => lambda { |a| a[:content].blank? }
	mount_uploader :image, ImageUploader
		validates :name, presence: true,
	                    length: { minimum: 3 }

end
