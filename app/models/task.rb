class Task < ApplicationRecord
  belongs_to :user
  has_one :notification
  has_many :task_lavels, dependent: :destroy
  has_many :lavels, through: :task_lavels

  validates :title, presence: true, length: { maximum: 50 }
  validates :description, length: { maximum: 200 }

  enum status: { waiting: 0, warking: 1, completed: 2 }
  enum priority: { low: 0, middle: 1, high: 2 }

  def save_lavels(lavels)
    lavels = [] if lavels.nil?
    current_lavels = self.lavels.pluck(:body) unless self.lavels.nil?
    old_lavels = current_lavels - lavels
    new_lavels = lavels - current_lavels

    old_lavels.each do |old_lavel_name|
      self.lavels.delete(Lavel.find_by(body: old_lavel_name))
    end

    new_lavels.each do |new_lavel_name|
      task_label = Lavel.find_or_create_by(body: new_lavel_name)
      self.lavels << task_label
    end
  end
end
