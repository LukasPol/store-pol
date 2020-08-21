class Product < ApplicationRecord
  belongs_to :category

  has_one_attached :photo

  validates :name, :description, :price, :quantity, presence: true

  validate :validate_price_n_quantity
  # validates :validate_price_n_quantity

  before_create do
    self.alias = self.name.try(:parameterize)
  end

  def validate_price_n_quantity
    if self.price < 0
      errors.add(:minimun, scope: 'activerecord.errors.models.product.attributes.price')
    end
    if self.quantity < 0
      errors.add(:minimun, scope: 'activerecord.errors.models.product.attributes.quantity')
    end
  end
end
