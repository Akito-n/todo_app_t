class Task < ApplicationRecord
  validates :title, presence: true, length: { maximum: 50 }
  validates :description, length: { maximum: 200 }


  enum status: {waiting: 0, warking: 1, completed: 2}


  def self.sort(q='created_at DESC')
    if q == 'asc'
      q = 'term ASC'
    elsif q == 'desc'
      q = 'term DESC'
    end
    order(q)
    q
  end

end
