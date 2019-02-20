class Task < ApplicationRecord
  validates :title, presence: true, length: { maximum: 50 }
  validates :description, length: { maximum: 200 }

  scope :sort_term, -> (p) {
  case p
  when 'created_at'
    order(created_at: :DESC)
  when 'asc'
    order(term: :asc)
  when 'desc'
    order(term: :desc)
  end
  }

end
