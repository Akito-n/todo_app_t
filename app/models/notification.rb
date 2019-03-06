class Notification < ApplicationRecord
  belongs_to :task
  belongs_to :user

  enum term: { green: 0, yellow: 1, red: 2 }
  enum read: { yet: 0, done: 1 }

  def kidoku
    update(read: 1)
  end

  private

  def self.set_notification
    # termがnilではないものを呼び出す
    tasks = Task.where.not(term: nil)
    tasks.each do |task|
      #新規作成されたタスクならクリエイト、前からあるタスクならfindする
      notification = Notification.find_or_create_by(task_id: task.id, user_id: task.user_id)
      # 期限が先なら、状態をgreenにしたい
      if Time.current < task.term
        notification.update(term: 0)
      # もし期限がメソッド実行時にカウントして３日以内にせまっていた場合orこのメソッドの初回実行時に３日以内で設定していた場合
      elsif Time.current <= task.term && task.term < Time.current.since(3.days)
        notification.update(term: 1)
      # 期限が過ぎていた場合or最初から期限を過去にしていた場合
      elsif task.term < Time.current
        notification.update(term: 2)
      end
    end
  end
end
