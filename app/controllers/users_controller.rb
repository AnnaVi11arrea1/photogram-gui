class UsersController < ApplicationController
  def index
    all_users = User.all

    @users = all_users.order({ :username => :asc }) 
    render({:template => "user_templates/index"})
  end

  def show
    the_username = params.fetch("username")
    matching_usernames = User.where({:username => the_username})
    @matching_user = matching_usernames.at(0)

    if @matching_user.nil?
      redirect_to("/404")
    else
      render({:template => "user_templates/show"})
    end


  end

  def update
    the_id = params.fetch("id")
    @matching_user = User.where({:id => the_id}).at(0)
    @matching_user.username = params.fetch("edit")
    @matching_user.save
    redirect_to({:template => "user_templates/show/#{matching_user.id }"})
  end

  def create
    @user = User.new
    @user.username = params.fetch("user_name")
    @user.save
    redirect_to({:template => "user_templates/show"})
  end
end
