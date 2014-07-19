class Restaurant < ActiveRecord::Base
	belongs_to :user
	mount_uploader :image, ImageUploader
		validates :name, presence: true,
	                    length: { minimum: 3 }

end
