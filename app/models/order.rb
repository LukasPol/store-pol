class Order < ApplicationRecord
  belongs_to :user
  belongs_to :product

  enum status: ['Esperando Pagamento', 'Preparando seu produto', 'Na transportadora']
end
