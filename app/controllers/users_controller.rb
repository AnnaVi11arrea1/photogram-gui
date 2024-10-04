class UsersController < ApplicationController
  def index
    all_users = User.all

    @users = all_users.order({ :username => :asc }) 
    render({:template => "user_templates/index"})
  end

  def show
    the_username = params.fetch("username")
    matching_user = User.where({:username => the_username})
    @the_user = matching_user.at(0)

    if @the_user.nil?
      redirect_to("/404")
    else
      render({:template => "user_templates/show"})
    end
  end

  def update
    the_id = params.fetch("id")
    @matching_user = User.where({:id => the_id}).at(0)
    @matching_user.username = params.fetch("username")
    @matching_user.save
    redirect_to("/users/#{matching_user.id }")
  end

  def create
    user = User.new
    user.username = params.fetch("username")
    user.save

    redirect_to("/users/#{user.username}")
  end
end
