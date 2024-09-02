require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user_author) { create(:user) }

  it { is_expected.to have_many(:products).dependent(:destroy) }

  it { is_expected.to validate_presence_of :email }

  describe '#author?' do
    let(:user_other) { create(:user) }
    let(:product) { create(:product, user: user_author) }

    it 'The user is the author product' do
      expect(user_author.author?(product)).to be true
    end

    it 'The user is not the author product' do
      expect(user_other.author?(product)).to be false
    end
  end

  describe '#guest?' do
    it 'The user is not a guest' do
      expect(user_author.guest?).to be false
    end
  end
end
