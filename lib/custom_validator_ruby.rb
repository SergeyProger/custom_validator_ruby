require 'custom_validator_ruby/version'
require 'custom_validator_ruby/validations'

module CustomValidatorRuby

  class CustomValidatorError < StandardError; end

  TYPES = %i[presence format type]

  def self.included(base)
    base.extend Validations
  end

  def validate!
    self.class.validations.each do |attr, options|
      options.each do |validation_type, value|
      raise CustomValidatorError, "#{validation_type} validation type is unknown" unless TYPES.include?(validation_type)
      send("check_#{validation_type}", send(attr), attr, value)
      end
    end
    true
  end

  def valid?
    validate!
  rescue CustomValidatorError
    false
  end

  private

  def check_presence(attr_value, attr, value)
    raise CustomValidatorError, "#{value} is unknown value for #{__method__}" unless value == true || value == false
    return true if (attr_value && value && attr_value != '') || (!attr_value && !value)
    raise CustomValidatorError, "#{attr} must be present" if value
    raise CustomValidatorError, "#{attr} must be absent" unless value
  end

  def check_format(attr_value, attr, value)
    raise CustomValidatorError, "#{value} has wrong format for #{__method__}. Expect Regexp" unless value.is_a?(Regexp)
    raise CustomValidatorError, "#{attr} must match Regexp: #{value.inspect}" unless attr_value.match?(value)
  end

  def check_type(attr_value, attr, value)
    raise CustomValidatorError, "#{value} is wrong value for #{__method__}. Expect Class name" unless value.is_a?(Class)
    raise CustomValidatorError, "#{attr} must be an instance of #{value}" unless attr_value.is_a?(value)
  end
end
