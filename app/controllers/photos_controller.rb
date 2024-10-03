class PhotosController < ApplicationController
  def index
    @photos = Photo.all
    render(:templates => "photos/index")
  end

  def show
    photo_id = params.fetch("id")
    @photo = Photo.where({ :id => photo_id}).at(0)

    render({ :templates => "photos/show"})
  end

  def add_comment
    photo_id = params.fetch("id")
    @photo = Photo.where({ :id => photo_id }).at(0)
    comment = Comment.new
    comment.body = params.fetch("comment")
    comment.author_id = params.fetch("author_id")
    comment.photo_id = photo_id
    comment.save

    redirect_to("/photos/" + photo_id)
  end

  def update
    photo_id = params.fetch("id")
    @photo = Photo.where({ :id => photo_id }).at(0)
    @photo.caption = params.fetch("usercaption")
    @photo.image = params.fetch("userphoto")
    @photo.save

    redirect_to("/photos/#{@photo.id}")
  end

  def destroy
    photo_id = params.fetch("id")
    @photo = Photo.where({ :id => photo_id }).at(0)
    @photo.destroy

    redirect_to("/photos")
  end
end
