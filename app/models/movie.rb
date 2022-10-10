class Movie < ApplicationRecord
  validates :url, presence: true, uniqueness: true, format: {
    with: /\Ahttps:\/\/youtu\.be\/([a-z]|[A-Z]|[0-9])+\z/, message: "is invalid"
  }

  belongs_to :user

  def embed_url
    "https://www.youtube.com/embed/" + video_id
  end
end
