class User < ApplicationRecord
  has_many :tasks, dependent: :destroy
  has_many :notifications, dependent: :destroy
  has_many :groups, dependent: :destroy
  has_many :members, dependent: :destroy

  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }

  enum role: { member: 0, admin: 1 }

  has_secure_password

  before_destroy :count_admin_user_for_destroy
  before_update :count_admin_user_for_edit

  mount_uploader :avatar, AvatarUploader

  def count_admin_user_for_destroy
    if User.all.admin.count == 1 && admin?
      errors.add :base, ''
      throw :abort
    end
  end

  def count_admin_user_for_edit
    if User.all.admin.count == 1 && role_changed?(from: 'admin', to: 'member')
      errors.add :base, ''
      throw :abort
    end
  end
end
