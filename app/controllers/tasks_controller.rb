class TasksController < ApplicationController
  before_action :set_task, only: %i[show edit update destroy]
  before_action :set_autocomplete_tag, only: %i[new edit]
  before_action :set_lavel_list, only: %i[create, update]
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
    if @task.save && @task.save_lavels(@lavels)
      flash[:success] = t('.succsess')
      redirect_to action: 'index'
    else
      render 'new'
    end
  end

  def edit
    gon.lavels = @task.lavels.pluck(:body)
  end

  def update
    if @task.update(task_params) && @task.save_lavels(@lavels)
      flash[:succsess] = t('.edit')
      redirect_to action: 'index'
    else
      render 'edit'
    end
  end

  def show; end

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

  def set_lavel_list
    @lavels = params[:lavels]
  end

  def set_autocomplete_tag
    gon.availavle_tags = Lavel.pluck(:body)
  end
end
