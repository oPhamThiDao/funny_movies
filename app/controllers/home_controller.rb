class HomeController < ApplicationController
  def index
    @reaction_movies = MovieUser.where(user: current_user).select(:status, :movie_id).index_by(&:movie_id)
    @movies = Movie.order(likes_count: :desc)
  end
end
