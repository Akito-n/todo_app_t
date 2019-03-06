class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :require_user_logged_in

  def index
    @search = @current_user.tasks.ransack(params[:q])
    @tasks = @search.result.page(params[:page]).per(10)
  end

  def new
    @task = @current_user.tasks.build
  end

  def create
    @task = @current_user.tasks.build(task_params)
    if @task.save
      flash[:success] = t('.succsess')
      redirect_to action: 'index'
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @task.update(task_params)

      flash[:succsess] = t('.edit')
      redirect_to action: 'index'
    else
      render 'edit'
    end
  end

  def show
  end

  def destroy

    if @task.destroy
      flash[:success] = t('.delete')
      redirect_to action: 'index'
    else
      flash.now[:danger] = t('.delete-faild')
      render 'index'
    end
  end

  private

  def task_params
    params.require(:task).permit(:title, :description, :term, :status, :priority)
  end

  def set_task
    @task = current_user.tasks.find(params[:id])
  end

end
