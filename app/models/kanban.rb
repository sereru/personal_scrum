class Kanban < ApplicationRecord
  validates :content, presence: true
  validates :stage, presence: true, numericality: {greater_than: 0, less_than: 6}
  validates :deadline, presence: true
  has_many :kanban_tag_relations, dependent: :destroy
  has_many :tags, through: :kanban_tag_relations, dependent: :destroy

  #importメソッド
  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      # IDが見つかれば、レコードを呼び出し、見つかれなければ、新しく作成
      task = find_by(id: row["id"]) || new
      # CSVからデータを取得し、設定する
      task.attributes = row.to_hash.slice(*updatable_attributes)
      task.save
    end
  end

  # 更新を許可するカラムを定義
  def self.updatable_attributes
    ["content", "stage", "deadline"]
  end
end
