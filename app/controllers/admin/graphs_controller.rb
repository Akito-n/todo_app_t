class Admin::GraphsController < ApplicationController
  before_action :require_user_logged_in
  before_action :authenticate_admin_user!
  def show
    task_lavels = TaskLavel.group(:lavel_id).count
    @lavel_data = task_lavels.map{|k,v|[Lavel.find(k).body, v]}.to_h
    @user_data = User.all.map {|user| [user.name, user.tasks.count]}.to_h
  end
end
