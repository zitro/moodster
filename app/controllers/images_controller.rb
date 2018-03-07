class ImagesController < ApplicationController
  def create
    # current_user.set_picture(request.raw_post)
    # current_user.save
    # byebug
    # @data = request.raw_post
    # @data1 = request.body
    File.open("plzwork.jpg", 'wb') {|f| f.write request.body.read }

    # TODO: save this blob as jpeg file somewhere on the disk
    # render html: "received file that is #{data.length} bytes long"
  end
end
