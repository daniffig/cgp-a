class Aspect < ApplicationRecord
  extend Enumerize

  has_and_belongs_to_many :products, join_table: :products_aspects

  enumerize :type, in: %i{LiteralAspect ObjectAspect}
  
end
