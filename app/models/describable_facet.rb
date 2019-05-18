class DescribableFacet < ApplicationRecord
  belongs_to :describable, polymorphic: true
  belongs_to :facet
end
