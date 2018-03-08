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
    @emo_hash = User.get_emotion_hash

    session[:emo] = @emo_hash    
    redirect_to @user

    # TODO: save this blob as jpeg file somewhere on the disk
    # render html: "received file that is #{data.length} bytes long"
  end
end
