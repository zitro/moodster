class ImagesController < ApplicationController
  def create
    data = request.raw_post
    # TODO: save this blob as jpeg file somewhere on the disk
    render html: "received file that is #{data.length} bytes long"
  end
end
