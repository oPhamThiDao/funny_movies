class ShareController < ApplicationController
  def new
    @movie = Movie.new
  end

  def create
    movie = MovieService.new(movie_params).create_movie
    redirect_to root_path
  end

  def reaction
    movie_user = MovieUser.find_or_initialize_by(user_id: current_user.id, movie_id: params[:id])
    movie_user.status = params[:status]
    if movie_user.save
      movie = movie_user.movie
      render json: { code: "ok", likes_count: movie.likes_count, dislikes_count: movie.dislikes_count }
    else
      render json: { code: "error" }
    end
  end

  private

  def movie_params
    params.require(:movie).permit(:url).tap do |param|
      param[:user_id] = current_user.id
    end
  end
end
