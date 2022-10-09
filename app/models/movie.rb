class Movie < ApplicationRecord
  validates :url, presence: true, uniqueness: true

  belongs_to :user

  def embed_url
    "https://www.youtube.com/embed/" + video_id
  end
end
