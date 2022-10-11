require "rails_helper"

RSpec.describe MovieUser, type: :model do
  describe "association" do
    it { should belong_to(:user) }
    it { should belong_to(:movie) }
  end

  describe "#update_like_count" do
    let!(:movie) { create :movie, likes_count: 0, dislikes_count: 0 }

    before do
      create :movie_user, movie: movie, status: "like"
      create :movie_user, movie: movie, status: "dislike"
      create :movie_user, movie: movie, status: "none"
    end

    it "should increase the number of likes" do
      create :movie_user, movie: movie, status: "like"
      movie.reload
      expect(movie.likes_count).to eq 2
      expect(movie.dislikes_count).to eq 1
    end

    it "should increase the number of dislikes" do
      create :movie_user, movie: movie, status: "dislike"
      movie.reload
      expect(movie.likes_count).to eq 1
      expect(movie.dislikes_count).to eq 2
    end

    it "should increase dislikes_count and decrease likes count" do
      MovieUser.find_by(status: "like").update(status: "dislike")
      movie.reload
      expect(movie.likes_count).to eq 0
      expect(movie.dislikes_count).to eq 2
    end

    it "should decrease dislikes_count and increase likes count" do
      MovieUser.find_by(status: "dislike").update(status: "like")
      movie.reload
      expect(movie.likes_count).to eq 2
      expect(movie.dislikes_count).to eq 0
    end
  end
end
