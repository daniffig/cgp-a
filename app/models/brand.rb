class Brand < ApplicationRecord
  include Facetable

  has_many :products, inverse_of: :brand
end