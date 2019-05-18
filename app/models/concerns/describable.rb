require 'active_support/concern'

module Describable
  extend ActiveSupport::Concern

  included do
    has_many :describable_facets, as: :describable
    has_many :facets, through: :describable_facets
  end
end