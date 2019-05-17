class Product < ApplicationRecord
  has_and_belongs_to_many :aspects, join_table: :products_aspects
end
