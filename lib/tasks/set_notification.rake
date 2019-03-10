namespace :set_notification do
  desc '通知設定'
  task :set_notification => :environment do
    Notification.set_notification
  end
end
