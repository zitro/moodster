require 'fileutils'

class ImagesController < ApplicationController
  def create
    @user = User.find(session[:user_id])
    @request_bod = request.body
    @saved_picture = File.open('./app/assets/images/plzwork.jpg', 'wb') {|f| f.write request.body.read }
    @string_api_return = User.get_emotion_hash
			# FileUtils.mv('plzwork.jpg', './assets/images/plzwork.jpg' )
    @new_feature = Feature.create(user_id: @user.id, hashreturn: @string_api_return)
    session[:emo] = @emo_hash
    redirect_to @user
  end

end
