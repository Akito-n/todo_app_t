class Task < ApplicationRecord
  belongs_to :user
  has_many :task_lavels
  has_many :lavels, through: :task_lavels

  validates :title, presence: true, length: { maximum: 50 }
  validates :description, length: { maximum: 200 }


  enum status: { waiting: 0, warking: 1, completed: 2 }

  enum priority: { low: 0, middle: 1, high: 2 }

end
