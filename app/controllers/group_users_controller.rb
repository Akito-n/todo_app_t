class GroupUsersController < ApplicationController
  before_action :require_user_logged_in

  def show
    @group = Group.find(params[:group_id])
    @user = User.find(params[:user_id])
    @tasks = @user.tasks.page(params[:page]).per(10)
  end
end
