class LaneKanbanRelation < ApplicationRecord
  belongs_to :lane
  belongs_to :kanban
end
