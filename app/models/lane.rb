class Lane < ApplicationRecord
  validates :name, presence: true
  validates :stage, presence: true
  has_many :lane_kanban_relations, dependent: :destroy
  has_many :kanbans, through: :lane_kanban_relations, dependent: :destroy
end
