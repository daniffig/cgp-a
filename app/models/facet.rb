class Facet < ApplicationRecord
  def self.with(type, val)
    persistable_class?(type) ? find_object(type, val) : find_literal(type, val)
  end

  def type
    JSON.parse(value).first
  end

  def type_as_class
    Facet.persistable_class?(type) ? type.constantize : nil
  end

  def val
    JSON.parse(value).second
  end

  def as_object
    (object_class = type_as_class) ? object_class.find(val) : nil
  end

  def as_literal
    val
  end

  private

  def self.persistable_class?(class_name)
    class_name.constantize.is_a?(Class) && class_name.constantize.ancestors.include?(ActiveRecord::Base) rescue false
  end

  def self.sanitize_val(val)
    val.is_a?(String) ? val.downcase : val
  end

  def self.find_literal(type, val)
    find_object(type.downcase, sanitize_val(val))
  end

  def self.find_object(type, val)
    find_or_initialize_by(value: [type, val].to_json)
  end
end