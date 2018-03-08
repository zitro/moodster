class Feature < ApplicationRecord
  belongs_to :user
  has_attached_file :image

  def gender
    string_api_return = User.get_emotion_hash
    hash_api_return = eval(string_api_return).first[:faceAttributes]
    session[:gender] = hash_api_return[:gender].capitalize
  end

  def age
  end

  def emotions
  end
end
