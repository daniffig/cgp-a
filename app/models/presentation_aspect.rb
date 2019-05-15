class PresentationAspect < ApplicationRecord
  belongs_to :presentation, inverse_of: :aspects
end
