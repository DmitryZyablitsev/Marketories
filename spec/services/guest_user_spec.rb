require 'rails_helper'

RSpec.describe GuestUser do
  let(:guest_user) { described_class.new }
  let(:product) { create(:product) }

  describe '#guest?' do
    it 'return true' do
      expect(guest_user.guest?).to be true
    end
  end

  describe '#author?' do
    it 'return false' do
      expect(guest_user.author?(product)).to be false
    end
  end
end
