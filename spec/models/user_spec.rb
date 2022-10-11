require "rails_helper"

RSpec.describe User, type: :model do
  describe "validation" do
    context "presence" do
      it { is_expected.to validate_presence_of(:username) }
    end
  end

  describe "#email_required?" do
    let(:user) { build :user }

    it { expect(user.email_required?).to be_falsy }
  end
end
