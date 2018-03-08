require 'net/http'
require 'pry'

# NOTE: You must use the same region in your REST call as you used to obtain your subscription keys.
#   For example, if you obtained your subscription keys from westus, replace "westcentralus" in the
#   URL below with "westus".
uri = URI('https://westcentralus.api.cognitive.microsoft.com/face/v1.0/detect')
uri.query = URI.encode_www_form({
    # Request parameters

    'returnFaceAttributes' => 'age,gender,emotion,makeup,glasses,facialHair,accessories'
})

request = Net::HTTP::Post.new(uri.request_uri)
# Request headers
request['Content-Type'] = 'application/json'
# NOTE: Replace the "Ocp-Apim-Subscription-Key" value with a valid subscription key.
request['Ocp-Apim-Subscription-Key'] = 'e2ffa199dd804b75ab4307de19b543f1'
# Request body
request.body = "{\"url\":\"http://liketherazor.com/wp-content/uploads/2014/08/1_Victoria-Jordan_Chris-Gillett-Houston-Headshot-Photographer.jpg\"}"

response = Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https') do |http|
    http.request(request)
end
binding.pry
puts response.body
