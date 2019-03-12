class Member < ApplicationRecord
  belongs_to :group
  belongs_to :user
  
  enum role: { member: 1, manager: 2 }
end
