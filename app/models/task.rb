class Task < ApplicationRecord
  validates :title, presence: true, length: { maximum: 50 }
  validates :description, length: { maximum: 200 }


  enum status: {waiting: 0, warking: 1, completed: 2}



end
