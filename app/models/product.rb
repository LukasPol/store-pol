class Product < ApplicationRecord
  validates :name, :description, :price, :quantity, presence: true

  has_one_attached :photo
end
