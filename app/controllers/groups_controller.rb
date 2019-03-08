class GroupsController < ApplicationController
  before_action :require_user_logged_in

  def index
    @groups = @current_user.groups
  end

  def new
    @group = @current_user.groups.build
    @emails = params[:email]
  end

  def create
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
