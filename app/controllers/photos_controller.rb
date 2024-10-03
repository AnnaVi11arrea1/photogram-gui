class PhotosController < ApplicationController
  def index
    @photos = Photo.all
    render(:templates => "photos/index")
  end

  def show
    the_id = params.fetch("the_id")
    @photo_id = Photo.where({ :id => the_id}).at(0)
    render({ :templates => "photos/show"})
  end
end
