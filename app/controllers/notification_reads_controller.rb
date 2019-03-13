class NotificationReadsController < ApplicationController

  def create
    @notification = Notification.find(params[:id])
    @notification.update(read: 1)
  end
end
