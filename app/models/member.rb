class Member < ApplicationRecord
  belongs_to :group

  enum role: { member: 1, manager: 2 }
end
