class CreateLanes < ActiveRecord::Migration[6.0]
  def change
    create_table :lanes do |t|
      t.integer :stage, null: false, unique: true
      t.string :name, null: false

      t.timestamps
    end
  end
end
