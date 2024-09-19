require 'rails_helper'

RSpec.describe CartItem, type: :model do
  it { is_expected.to belong_to :cart }
  it { is_expected.to belong_to :product }

  describe 'validations' do
    let(:cart_item) { create(:cart_item) }

    it { is_expected.to validate_presence_of :cart }
    it { is_expected.to validate_presence_of :product }
    it { cart_item; should validate_uniqueness_of(:cart_id).scoped_to([:product_id]) }
  end
end
