class Task < ApplicationRecord
  belongs_to :user
  has_many :task_tags, dependent: :destroy
  has_many :tags, through: :task_tags


  accepts_nested_attributes_for :task_tags

  validates :title, presence: true, length: { maximum: 50 }
  validates :description, length: { maximum: 200 }


  enum status: { waiting: 0, warking: 1, completed: 2 }

  enum priority: { low: 0, middle: 1, high: 2 }


  def save_tags(tags)
    current_tags = self.tags.pluck(:body) unless self.tags.nil?
    old_tags = current_tags - tags
    new_tags = tags - current_tags


    old_tags.each do |old_name|
      self.tags.delete(Tag.find_by(name: old_name))
    end

    new_tags.each do |new_name|
      task_tag = Tag.find_or_create_by(name: new_name)
      self.tags << task_tag
    end
  end

end
