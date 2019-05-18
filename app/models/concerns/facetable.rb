require 'active_support/concern'

module Facetable
  extend ActiveSupport::Concern

  included do

    def as_facet
      Facet.find_or_initialize_by(value: to_value)
    end

    private

    def to_value
      [self.class.name, self.id].to_json
    end
  end
end