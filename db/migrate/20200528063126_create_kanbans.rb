class CreateKanbans < ActiveRecord::Migration[6.0]
  def change
    create_table :kanbans do |t|
      t.text :content
      t.integer :stage
      t.datetime :deadline

      t.timestamps
    end
  end
end
