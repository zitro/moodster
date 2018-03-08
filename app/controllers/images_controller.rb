class ImagesController < ApplicationController
  def create
    @user = User.find(session[:user_id])
    @request_bod = request.body
    @saved_picture = File.open("plzwork.jpg", 'wb') {|f| f.write request.body.read }
    @string_api_return = User.get_emotion_hash

    @new_feature = Feature.create(user_id: @user.id, hashreturn: @string_api_return, avatar: @request_bod)
    session[:emo] = @emo_hash
    byebug
    redirect_to @user
  end

end
