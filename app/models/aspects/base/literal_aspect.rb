class LiteralAspect < Aspect
  alias_method :aspectable!, :aspectable
  
  def aspectable=(object)
    self.value = [object.class.name, object].to_json
  end

  def aspectable
    JSON.parse(value).second
  end

  def aspectable!
  end
end