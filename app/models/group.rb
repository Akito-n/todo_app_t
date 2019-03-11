class Group < ApplicationRecord
  belongs_to :user
  has_many :tasks
  has_many :members

  validates :name, presence: true, length: { maximum: 50 }
end
