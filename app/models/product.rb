class Product < ApplicationRecord
  belongs_to :brand, inverse_of: :products

  has_many :aspects, inverse_of: :product, class_name: 'ProductAspect'
  has_many :presentations, inverse_of: :product
end
