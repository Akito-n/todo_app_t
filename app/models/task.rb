class Task < ApplicationRecord
  include RankedModel
  ranks :row_order, :class_name => 'Task'
end
