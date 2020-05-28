class Kanban < ApplicationRecord
  validates :content, presence: true
  validates :stage, presence: true, numericality: {greater_than: 0, less_than: 6}
  validates :deadline, presence: true
end
