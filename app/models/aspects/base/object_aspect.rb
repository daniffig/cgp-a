class ObjectAspect < Aspect
  def aspectable=(object)
    self.value = [object.class.name, object.id].to_json
  end

  def aspectable
    aspectable_class.find(aspectable_id)
  end

  def aspectable!
    aspectable_class.find!(aspectable_id)
  end

  private

  def aspectable_class
    JSON.parse(value).first.constantize
  end

  def aspectable_id
    JSON.parse(value).second
  end
end