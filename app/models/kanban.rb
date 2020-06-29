class Kanban < ApplicationRecord
  validates :content, presence: true
  validates :deadline, presence: true
  
  has_many :kanban_tag_relations, dependent: :destroy
  has_many :tags, through: :kanban_tag_relations, dependent: :destroy
  
  has_many :lane_kanban_relations, dependent: :destroy
  has_many :lanes, through: :lane_kanban_relations, dependent: :destroy

  #importメソッド
  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      # IDが見つかれば、レコードを呼び出し、見つかれなければ、新しく作成
      task = find_by(id: row["id"]) || new
      # CSVからデータを取得し、設定する
      task_hash = row.to_hash
      task.attributes = row.to_hash.slice(*updatable_attributes)
      task.save

      kanban = Kanban.last 
      if lane = Lane.find_by(name: task_hash["lane_name"])
        @relation = LaneKanbanRelation.new(lane_id: lane.id, kanban_id: kanban.id)
        @relation.save
      end

      if task_hash["tag_name"] != nil
        tags = task_hash["tag_name"].split(" ")
        tags.each do |name|
          if tag = Tag.find_by(name: name)
            @ralat = KanbanTagRelation.new(tag_id: tag.id, kanban_id: kanban.id)
            @ralat.save
          else
            @tag = Tag.new(name: name)
            @tag.save
            tag = Tag.last
            @ralat = KanbanTagRelation.new(tag_id: tag.id, kanban_id: kanban.id)
            @ralat.save
          end
        end
      end 
    end
  end

  # 更新を許可するカラムを定義
  def self.updatable_attributes
    ["content", "deadline"]
  end

end
