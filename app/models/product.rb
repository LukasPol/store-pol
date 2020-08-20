class Product < ApplicationRecord
  belongs_to :category

  has_one_attached :photo

  validates :name, :description, :price, :quantity, presence: true

  before_create do
    self.alias = self.name.try(:parameterize)
  end
end
