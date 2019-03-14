class Group < ApplicationRecord
  belongs_to :user
  has_many :tasks
  has_many :notifications
  has_many :members
  accepts_nested_attributes_for :members, allow_destroy: true

  validates :name, presence: true, length: { maximum: 50 }
end
