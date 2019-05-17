class IntegerAspect < LiteralAspect
  validates :value, numericality: { only_integer: true }

  def value
    Integer(super)
  end
end