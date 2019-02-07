class TasksController < ApplicationController
  def index
    @tasks = Task.all #t
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.save! #test
    flash[:success] = 'success registed'
     redirect_to action: 'index'
  end

  def edit
  end

  def show
  end

  def destroy
  end

  private

  def task_params
    params.require(:task).permit(:title, :description)
  end
end
