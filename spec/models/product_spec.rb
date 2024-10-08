require 'rails_helper'

RSpec.describe Product, type: :model do
  it { is_expected.to belong_to :user }

  it { is_expected.to validate_presence_of :title }
  it { is_expected.to validate_presence_of :description }
  it { is_expected.to validate_presence_of :specification }
  it { is_expected.to validate_presence_of :price }
end
