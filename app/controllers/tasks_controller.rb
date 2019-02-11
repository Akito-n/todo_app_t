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
    @task.save
    flash[:success] = '作成しました！'
    redirect_to action: 'index'
  end

  def edit
  end

  def update
    @task.update(task_params)
    flash[:succsess] = '更新しました！'
    redirect_to action: 'index'
  end

  def show
  end

  def destroy
    @task.destroy
    flash[:success] = '削除しました！'
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
