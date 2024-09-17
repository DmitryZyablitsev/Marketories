require 'rails_helper'

RSpec.describe CartItemPolicy, type: :policy do
  subject { described_class }

  let!(:user_buyer) { create(:user, :buyer) }
  let!(:user_other) { create(:user, :buyer) }
  let!(:cart_item) { create(:cart_item, cart: user_buyer.cart) }
 

  permissions :create?, :update?, :destroy?  do
    
    context 'grants access to' do
      it "the owner of the cart" do
        expect(subject).to permit(user_buyer, cart_item)
      end

      it "the admin" do
        expect(subject).to permit(User.new(role: 'admin'), cart_item)
      end
    end

    context 'denies access if' do
      it 'guest' do
        expect(subject).not_to permit(nil, cart_item)
      end

      it 'not the owner of the shopping cart' do
        expect(subject).not_to permit(user_other, cart_item)
      end
    end
  end
end
