class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]


  def index
    @tasks = Task.all.order('created_at DESC')
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      flash[:success] = 'success registed'
      redirect_to action: 'index'
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @task.update(task_params)
      flash[:succsess] = 'update successed!'
      redirect_to action: 'index'
    else
      render 'edit'
    end
  end

  def show
  end

  def destroy
    @task.destroy
    flash[:success] = 'delete!'
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
