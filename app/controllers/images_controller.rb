class ImagesController < ApplicationController
  def create
    @user = User.find(session[:user_id])
    # current_user.set_picture(request.raw_post)
    # current_user.save
    # byebug
    # @data = request.raw_post
    # @data1 = request.body
    @dog = "poodle"
    @saved_picture = File.open("plzwork.jpg", 'wb') {|f| f.write request.body.read }
    @string_api_return = User.get_emotion_hash



    @new_feature = Feature.create(user_id: @user.id, hashreturn: @string_api_return)

    session[:emo] = @emo_hash
    redirect_to @user

    # TODO: save this blob as jpeg file somewhere on the disk
    # render html: "received file that is #{data.length} bytes long"
  end
end
