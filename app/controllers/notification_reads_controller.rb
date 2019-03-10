class NotificationReadsController < ApplicationController

  def update
    @notification = Notification.find(params[:id])
    if @notification.update(read: 1)
      flash[:succsess] = ''
      redirect_to controller: 'tasks', action: 'index'
    else
      flash[:danger] = ''
      redirect_to controller: 'tasks', action: 'index'
    end
  end
end
