require 'net/http'

class User < ApplicationRecord
  validates :name, uniqueness: true, presence: true
  validates :password, presence: true
  has_secure_password
  has_many :user_emotions
  has_many :emotions, through: :user_emotions
  has_many :photos
	mount_uploader :image, UserImageUploader

  def self.get_emotion_hash
    # NOTE: You must use the same region in your REST call as you used to obtain your subscription keys.
    #   For example, if you obtained your subscription keys from westcentralus, replace "westus" in the
    #   URL below with "westcentralus".
    uri = URI('https://westus.api.cognitive.microsoft.com/emotion/v1.0/recognize')
    uri.query = URI.encode_www_form({
    })
    request = Net::HTTP::Post.new(uri.request_uri)
    # Request headers
    request['Content-Type'] = 'application/octet-stream'
    # NOTE: Replace the "Ocp-Apim-Subscription-Key" value with a valid subscription key.
    request['Ocp-Apim-Subscription-Key'] = '5ea7409c64384da99125311ed192b572'
    # Request body
    # request.body = "{\"url\":\"http://liketherazor.com/wp-content/uploads/2014/08/1_Victoria-Jordan_Chris-Gillett-Houston-Headshot-Photographer.jpg\"}"
    data = File.read("./plzwork.jpg")
    request.body = data
    response = Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https') do |http|
        http.request(request)
    end
    return response.body
  end

end
