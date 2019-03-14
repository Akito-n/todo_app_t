class GroupsController < ApplicationController
  before_action :require_user_logged_in
  before_action :set_group, only: [:show, :edit, :update, :destroy]
  before_action :require_current_user_be_in_group, only: [:show, :edit, :update, :destroy]
  def index
    @members = @current_user.members.includes(:group)
    set_groups
  end

  def new
    @group = @current_user.groups.build
  end

  def create
    @group = @current_user.groups.build(group_params)
    if @group.save && @current_user.groups << @group
      @group.members.create(role: 2, user_id: @current_user.id)
      flash[:success] = t('.success')
      redirect_to controller: 'groups', action: 'index'
    else
      flash.now[:danger] = t('.danger')
      render 'new'
    end
  end

  def show
    @search = @group.tasks.ransack(params[:q])
    @tasks = @search.result.includes(:user).page(params[:page]).per(10)
    @notifications = @group.notifications.includes(:task)
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
    @group = @current_user.members.where(group_id: params[:id]).first.group
  end

  def set_groups
    @groups = @members.map { |member| member.group }
  end
end
