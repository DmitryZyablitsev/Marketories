class Product < ApplicationRecord
  belongs_to :user

  validates :title, :description, :specification, :price, presence: true
end
