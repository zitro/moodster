class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
	# mount_base64_uploader :image, UserImageUploader
end
