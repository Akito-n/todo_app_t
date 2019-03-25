class Notification < ApplicationRecord
  belongs_to :task
  belongs_to :group

  enum term: { green: 0, yellow: 1, red: 2 }
  enum read: { yet: 0, done: 1 }

  def kidoku
    update(read: 1)
  end

  private

  def self.notification_management
    notifications = Notification.all
    notifications.each do |notification|
      #Notificationにあるタスクのうち、完了になったものは消す
      if notification.task.completed?
        notification.delete
        return
      end
      #期限が3日以内の場合:黄色
      if Time.current <= notification.task.term && notification.task.term < Time.current.since(3.days)
        notification.update(term: 1)
      #期限が過ぎている場合:赤
      elsif notification.task.term < Time.current
        notification.update(term: 2)
      #それ以外の場合（黄色or赤だったが、期限が延びた場合はお知らせから消す）
      else
        notification.delete
      end
    end
  end

  def self.set_notification
    self.notification_management
    # termがnilではないもの、且つ’完了’ではないタスクを呼び出す
    tasks = Task.where.not(term: nil, status: 2)
    tasks.each do |task|
      # タスクの期限が3日以内だった場合
      #byebug
      if Time.current <= task.term && task.term < Time.current.since(3.days)
        notification = Notification.find_or_create_by(task_id: task.id, group_id: task.group_id)
        notification.update(term: 1)
        NotificationMailer.notification_email(task.user, task).deliver
      # 期限が過ぎていた場合
      elsif task.term < Time.current
        notification = Notification.find_or_create_by(task_id: task.id, group_id: task.group_id)
        notification.update(term: 2)
      end
    end
  end
end
