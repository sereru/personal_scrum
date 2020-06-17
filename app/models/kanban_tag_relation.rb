class KanbanTagRelation < ApplicationRecord
  belongs_to :kanban
  belongs_to :tag
end
