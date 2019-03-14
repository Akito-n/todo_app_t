namespace :notification_record do
  desc '定期実行させるお知らせカラムの設定'
  task :setting => :environment do
    Notification.set_notification
  end
end
