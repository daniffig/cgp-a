class Api::V1::ProductResource < Api::V1::BaseResource
  attribute :name
  attribute :ean_code

  has_one :brand

  has_many :presentations
end
