class Category < ApplicationRecord
  # belongs_to :parent, class_name: 'Category', foreign_key: :parent_id, optional: true

  # has_many :categories, foreign_key: :parent_id
  has_many :products

  validates :name, presence: true

  before_create do
    self.alias = self.name.downcase.try(:parameterize)
  end
end
