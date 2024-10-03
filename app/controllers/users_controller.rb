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
end
