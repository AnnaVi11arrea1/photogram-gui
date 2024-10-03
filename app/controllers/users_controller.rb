class UsersController < ApplicationController
  def index
    @users = User.all
    render({:template => "user_templates/index"})
  end

  def show
    the_id = params.fetch("the_id")
    @matching_user = User.where({:id => the_id}).at(0)
    render({:template => "user_templates/show"})
  end

  def update
    the_id = params.fetch("the_id")
    @matching_user = User.where({:id => the_id}).at(0)
    @matching_user.username = params.fetch("user_name")
    @matching_user.save
    redirect_to({:template => "user_templates/show"})
  end

  def create
    @user = User.new
    @user.username = params.fetch("user_name")
    @user.save
    redirect_to("/user/" + @user.id.to_s)
  end
end
