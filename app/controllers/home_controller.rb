class HomeController < ApplicationController
  def index
    @reaction_movies = if user_signed_in?
      MovieUser.where(user: current_user).select(:status, :movie_id).index_by(&:movie_id)
    else
      {}
    end
    @movies = Movie.order(likes_count: :desc, dislikes_count: :asc)
  end
end
