class UsersController < ApplicationController
  def index
    @users = User.all
    render({:template => "user_templates/index"})
  end

  def show
    matching_user = params.fetch("the_id")
    @user = User.where({:id => matching_user.id}).at(0)
    render({:template => "user_templates/show"})
  end
end
