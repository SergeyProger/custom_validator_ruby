module Validations
  attr_reader :validations

  def validate(attribute, options)
    @validations ||= {}
    @validations[attribute] = options
  end
end