class NotificationMailer < ApplicationMailer
  default from: 'notification@test.com'

  def notification_email(user, task)
    @user = user
    @task = task
    mail(to: @user.email, subject: '期限が迫っているタスクがあります！')
  end
end
