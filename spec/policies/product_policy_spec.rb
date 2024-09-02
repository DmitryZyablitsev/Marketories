require 'rails_helper'

RSpec.describe ProductPolicy, type: :policy do
  subject { described_class }

  let(:user_seller) { create(:user, :seller) }
  let(:user_seller2) { create(:user, :seller) }
  let(:user_buyer) { create(:user, :buyer) }
  let(:product) { create(:product, user: user_seller) }
  let(:products) { create_list(:product, 3) }

  permissions :index? do
    context 'grants access to' do
      it 'guest' do
        p subject
        expect(subject).to permit(nil, products)
      end

      %w[buyer seller admin].each do |user_role|
        it user_role do
          expect(subject).to permit(User.new(role: user_role), products)
        end
      end
    end
  end

  permissions :show? do
    context 'grants access to' do
      it 'guest' do
        expect(subject).to permit(nil, product)
      end

      %w[buyer seller admin].each do |user_role|
        it user_role do
          expect(subject).to permit(User.new(role: user_role), product)
        end
      end
    end
  end

  permissions :create? do
    context 'grants access to' do
      %w[seller admin].each do |user_role|
        it user_role do
          expect(subject).to permit(User.new(role: user_role), product)
        end
      end
    end

    context 'denies access if' do
      it 'guest' do
        expect(subject).not_to permit(nil, product)
      end

      it 'buyer' do
        expect(subject).not_to permit(user_buyer, product)
      end
    end
  end

  permissions :update?, :destroy?  do
    context 'grants access if user is' do
      it 'admin' do
        expect(subject).to permit(User.new(role: 'admin'), product)
      end

      it 'author' do
        expect(subject).to permit(user_seller, product)
      end
    end

    context 'denies access if user is' do
      it 'not author' do
        expect(subject).not_to permit(user_seller2, product)
      end

      it 'guest' do
        expect(subject).not_to permit(nil, products)
      end

      it 'buyer' do
        expect(subject).not_to permit(user_buyer, product)
      end
    end
  end
end
