require "youtube/client"

class MovieService
  def initialize params = {}
    @params = params
  end

  attr_accessor :params

  def create_movie
    movie = Movie.new(params)
    data = Youtube::Client.video_detail(video_id)
    if data.any?
      movie.assign_attributes(video_id: video_id, **data["items"].first["snippet"].slice("title", "description"))
      movie.save
    else
      movie.errors.add(:url, "URL invalid")
    end
    movie
  end

  private

  def video_id
    params[:url].gsub("https://youtu.be/", "")
  end
end
