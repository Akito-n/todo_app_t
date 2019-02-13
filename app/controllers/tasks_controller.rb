class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]


  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to action: 'index'
      flash[:success] = t('.succsess')
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @task.update(task_params)
      redirect_to action: 'index'
      flash[:succsess] = t('.edit')
    else
      render 'edit'
    end
  end

  def show
  end

  def destroy
    @task.destroy
    flash[:success] = t('.delete')
    redirect_to action: 'index'
  end

  private

  def task_params
    params.require(:task).permit(:title, :description)
  end

  def set_task
    @task = Task.find(params[:id])
  end

end
