class Task < ApplicationRecord
  validates :title, presence: true, length: { maximum: 50 }
  validates :description, length: { maximum: 200 }


  def self.sort(q)
    if q == 'asc'
      q = 'term ASC'
    elsif q == 'desc'
      q = 'term DESC'
    else
      q ='created_at DESC'
    end
    order(q)
  end

end
