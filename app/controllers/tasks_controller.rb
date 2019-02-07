class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]


  def index
    @tasks = Task.all #t
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.save! #t
    flash[:success] = 'success registed'
    redirect_to action: 'index'
  end

  def edit
  end

  def update
    @task.update!(task_params) #t
    flash[:succsess] = 'update successed!'
    redirect_to action: 'index'
  end

  def show
  end

  def destroy
    @task.destroy! #t
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
