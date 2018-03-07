class User < ApplicationRecord
  validates :name, uniqueness: true, presence: true
  validates :password, presence: true
  has_secure_password
  has_many :user_emotions
  has_many :emotions, through: :user_emotions
  has_many :photos
	mount_uploader :image, UserImageUploader

end
