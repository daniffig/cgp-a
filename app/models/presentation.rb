class Presentation < ApplicationRecord
  belongs_to :product, inverse_of: :presentations

  has_many :aspects, inverse_of: :presentation, class_name: 'PresentationAspect'
end
