class CreateMovies < ActiveRecord::Migration[7.0]
  def change
    create_table :movies do |t|
      t.belongs_to :user
      t.text :url
      t.string :video_id
      t.string :title
      t.string :source_type
      t.text :description
      t.bigint :likes_count, null: false, default: 0
      t.bigint :dislikes_count, null: false, default: 0

      t.timestamps
    end
  end
end
