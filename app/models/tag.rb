class Tag < ApplicationRecord
  has_many :kanban_tag_relations, dependent: :destroy
  has_many :kanbans, through: :kanban_tag_relations, dependent: :destroy
end