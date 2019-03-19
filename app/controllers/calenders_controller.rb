class CalendersController < ApplicationController
  before_action :require_user_logged_in
  before_action :set_group, only: [:index]
  def index
    @tasks = @group.tasks
  end

  def set_group
    @group = @current_user.members.where(group_id: params[:group_id]).first.group
  end
end
