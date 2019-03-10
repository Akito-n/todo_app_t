class GroupsController < ApplicationController
  before_action :require_user_logged_in
  before_action :set_group, only: [:show, :edit, :update, :destroy]

  def index
    @groups = @current_user.groups
  end

  def new
    @group = @current_user.groups.build
  end

  def create
    @group = @current_user.groups.build(group_params)
    if @group.save && @current_user.groups << @group
      flash[:success] = t('.success')
      redirect_to controller: 'groups', action: 'index'
    else
      flash.now[:danger] = t('.danger')
      render 'new'
    end
  end

  def show
    @users = @group.users
  end

  def edit
  end

  def update
  end

  def destroy
    if @group.destroy
      flash[:success] = t('.delete')
      redirect_to action: 'index'
    else
      flash.now[:danger] = t('.delete-faild')
      render new
    end
  end

  private
  def group_params
    params.require(:group).permit(:name)
  end

  def set_group
    @group = @current_user.groups.find(params[:id])
  end
end
