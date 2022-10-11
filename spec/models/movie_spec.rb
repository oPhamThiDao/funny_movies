require "rails_helper"

RSpec.describe Movie, type: :model do
  describe "validation" do
    context "presence" do
      it { is_expected.to validate_presence_of(:url) }
    end

    context "uniqueness" do
      it { is_expected.to validate_uniqueness_of(:url) }
    end

    context "format" do
      # not allow
      it { is_expected.not_to allow_value("https://youtu.be/xxx/").for(:url) }
      it { is_expected.not_to allow_value("http://youtu.be/xxx").for(:url) }

      # allow
      it { is_expected.to allow_value("https://youtu.be/xxx").for(:url) }
      it { is_expected.to allow_value("https://youtu.be/z3HUSoxx-").for(:url) }
    end
  end

  describe "association" do
    it { should belong_to(:user) }
  end

  describe "#embed_url" do
    let(:movie) { build :movie, video_id: "z3HUSoxx-" }

    it { expect(movie.embed_url).to eq "https://www.youtube.com/embed/z3HUSoxx-" }
  end
end
