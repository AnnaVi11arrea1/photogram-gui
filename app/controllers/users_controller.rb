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
    user_id = params.fetch("id")
    @the_user = User.where({:id => user_id}).first
    @the_user.username = params.fetch("username")
    @the_user.save
    redirect_to("/users/#{@the_user.id}")

  end

  def create
    user = User.new
    user.username = params.fetch("username")
    user.save

    redirect_to("/users/#{user.username}")
  end
end
