class TasksController < ApplicationController
  before_action :set_task, only: %i[show edit update destroy]
  before_action :set_autocomplete_tag, only: %i[new edit]
  before_action :set_lavel_list, only: %i[create update]
  before_action :set_group, only: %i[new create]
  before_action :require_user_logged_in

  def index
    @search = @current_user.tasks.ransack(params[:q])
    @tasks = @search.result.page(params[:page]).per(10)
    @notifications = @current_user.notifications.includes(:task)
  end

  def new
    @task = @group.tasks.build
  end

  def create
    @task = @group.tasks.build(task_params)
    @task.user_id = @current_user.id
    if @task.save && @task.save_lavels(@lavels)
      flash[:success] = t('.succsess')
      redirect_to group_path(@group)
    else
      render 'new'
    end
  end

  def edit
    gon.lavels = @task.lavels.pluck(:body)
  end

  def update
    @group = Group.find(@task.group_id)
    if @task.update(task_params) && @task.save_lavels(@lavels)
      flash[:succsess] = t('.edit')
      redirect_to group_path(@group)
    else
      render 'edit'
    end
  end

  def show
  end

  def destroy
    @group = Group.find(@task.group_id)
    if @task.destroy
      flash[:success] = t('.delete')
      redirect_to group_path(@group)
    else
      flash[:danger] = t('.delete-faild')
      redirect_back(fallback_location: root_path)
    end
  end

  private

  def task_params
    params.require(:task).permit(:title, :description, :term, :status, :priority, :image )
  end

  def set_task
    @task = Task.find(params[:id])
  end

  def set_lavel_list
    @lavels = params[:lavels]
  end

  def set_autocomplete_tag
    gon.availavle_tags = Lavel.pluck(:body)
  end

  def set_group
    @group = current_user.members.where(group_id: params[:group_id]).first.group
  end
end
