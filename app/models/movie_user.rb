class MovieUser < ApplicationRecord
  belongs_to :movie
  belongs_to :user

  enum :status, { none: 0, like: 1, dislike: 2 }, prefix: true, scopes: false

  before_save :update_like_count

  def update_like_count
    if new_record?
      movie.likes_count += 1 if status_like?
      movie.dislikes_count += 1 if status_dislike?
    else
      if status_changed?
        if status_was == "none"
          movie["#{status}s_count"] += 1
        else
          movie["#{status_was}s_count"] -= 1
          movie["#{status}s_count"] += 1 unless status_none?
        end
      end
    end
    movie.save(validate: false)
  end
end
