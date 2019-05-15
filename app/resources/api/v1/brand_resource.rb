class Api::V1::BrandResource < Api::V1::BaseResource
  attribute :name

  has_many :products
end
