class ProductAspect < ApplicationRecord
  belongs_to :product, inverse_of: :aspects
end
