# CustomValidatorRuby

This is ruby gem performs custom validation checks.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'custom_validator_ruby',  github: 'SergeyProger/custom_validator_ruby'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install custom_validator_ruby
## Usage

Usage example: 
```ruby
class TestClass
  include CustomValidatorRuby
  attr_accessor :name, :age
  
  validate :name, presence: true, type: String, format: /\w{3,15}/
  validate :age, presence: true, type: Integer

  def initialize(attr={})
    @name = attr[:name]
    @age = attr[:age]
  end
end
```
