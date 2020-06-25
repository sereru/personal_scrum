class CreateLaneKanbanRelations < ActiveRecord::Migration[6.0]
  def change
    create_table :lane_kanban_relations do |t|
      t.references :lane, null: false, foreign_key: true
      t.references :kanban, null: false, foreign_key: true

      t.timestamps
    end
  end
end
