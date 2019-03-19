class CustomTaskListsController < ApplicationController
  before_action :require_user_logged_in
  before_action :set_group, only: [:index]
  before_action :require_current_user_be_in_group, only: [:index]

  def index
    @tasks = @group.tasks.includes(:user).rank(:row_order).page(params[:page]).per(10)
  end

  def sort
    @task = Task.find(params[:custom_task_list_id])
    @task.update(task_params)
    render body: nil
  end


  private

  def set_group
    @group = @current_user.members.where(group_id: params[:group_id]).first.group
  end

  def task_params
    params.require(:task).permit(:row_order_position)
  end

end
