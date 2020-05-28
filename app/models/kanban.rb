class Kanban < ApplicationRecord
  validates :content, presence: true
  validates :stage, presence: true, inclusion: { minimum: 0, maximum: 4}
  validates :deadline, presence: true, 
end
