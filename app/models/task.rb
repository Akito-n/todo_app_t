class Task < ApplicationRecord
  validates :title, presence: true, length: { maximum: 50 }
  validates :description, length: { maximum: 200 }


  def self.sort(q='created_at DESC')
    if q == 'asc'
      q = 'term ASC'
    elsif q == 'desc'
      q = 'term DESC'
    end
    order(q)
  end

end
