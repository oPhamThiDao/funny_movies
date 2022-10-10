class CreateMovieUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :movie_users do |t|
      t.belongs_to :movie
      t.belongs_to :user
      t.integer :status, null: false, default: 0

      t.timestamps
    end
  end
end
