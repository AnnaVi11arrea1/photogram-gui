class PhotosController < ApplicationController
  def index
    @photos = Photo.all
    render(:templates => "photos/index")
  end

  def show
    photo_id = params.fetch("id")
    @photo = Photo.where({ :id => photo_id}).at(0)

    @commenter = Comment.all.where({ :photo_id => photo_id})

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

  def create
    input_image = params.fetch("query_image")
    input_caption = params.fetch("query_caption")
    input_owner_id = params.fetch("query_owner_id")

    a_new_photo = Photo.new
    a_new_photo.image = input_image
    a_new_photo.caption = input_caption
    a_new_photo.owner_id = input_owner_id
    a_new_photo.save

    redirect_to("/photos/#{a_new_photo.id}")
  
  end

end
