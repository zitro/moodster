require 'fileutils'

class ImagesController < ApplicationController
  def create
    @user = User.find(session[:user_id])
    @request_bod = request.body

    #test
    Dir.mkdir("./app/assets/images/#{@user.id}") unless Dir.exist?("./app/assets/images/#{@user.id}")
    @saved_picture = File.open("./app/assets/images/#{@user.id}/#{@user.features.length+1}.jpg", 'wb') {|f| f.write request.body.read }

    # @saved_picture = File.open('./app/assets/images/plzwork.jpg', 'wb') {|f| f.write request.body.read }
    @string_api_return = User.get_emotion_hash(session[:user_id])
    @new_feature = Feature.create(user_id: @user.id, hashreturn: @string_api_return)
    session[:emo] = @emo_hash
    redirect_to @user
  end

end
