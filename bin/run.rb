require 'net/http'

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

 request.body = "/Users/bryan/Development/learn_flatiron/code/mod2/final_project/moodster/app/assets/images/test.jpg"


response = Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https') do |http|
    http.request(request)
end

puts response.body
