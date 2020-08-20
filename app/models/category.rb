class Category < ApplicationRecord
  # has_friendly_id :name

  has_many :products

  validates :name, presence: true

  before_create do
    self.name = self.name.downcase
    self.alias = self.name.try(:parameterize)
  end
end
