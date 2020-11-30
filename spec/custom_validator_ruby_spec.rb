RSpec.describe CustomValidatorRuby do
  it "has a version number" do
    expect(CustomValidatorRuby::VERSION).not_to be nil
  end

  before do
    @validator = Class.new do
      include CustomValidatorRuby
      attr_accessor :name, :age, :error

      validate :name, presence: true, type: String, format: /\w{3,15}/
      validate :age, presence: true, type: Integer
      validate :error, presence: false

      def initialize(attr={})
        @name = attr[:name]
        @age = attr[:age]
        @error = attr[:error]
      end
    end
  end

  describe '#validate!' do
    context 'success' do
      it 'validate' do
        result = @validator.new(name: 'Name', age: 14)
        expect(result.validate!).to be_truthy
      end
    end

    context 'failed' do
      it 'invalid age' do
        expect {  @validator.new(name: 'Name').validate!}.to raise_error(CustomValidatorRuby::CustomValidatorError, 'age must be present')
      end
      it 'invalid name' do
        expect { @validator.new(name: '', age: 1).validate!}.to raise_error(CustomValidatorRuby::CustomValidatorError, 'name must be present')
      end
      it 'invalid name format' do
        expect {  @validator.new(name: 'Na', age: 1).validate!}.to raise_error(CustomValidatorRuby::CustomValidatorError, 'name must match Regexp: /\w{3,15}/')
      end
      it 'invalid name type' do
        expect { @validator.new(name: 843, age: 1).validate!}.to raise_error(CustomValidatorRuby::CustomValidatorError, 'name must be an instance of String')
      end
      it 'invalid error' do
        expect { @validator.new(name: 'Name', age: 1, error: 'some error').validate!}.to raise_error(CustomValidatorRuby::CustomValidatorError, 'error must be absent')
      end
      it 'invalid format' do
        format = Class.new do
          include CustomValidatorRuby
          attr_accessor :name
          validate :name, format: 'invalid'

          def initialize(attr={})
            @name = attr[:name]
          end
        end
        expect { format.new(name: 'Name').validate!}.to raise_error(CustomValidatorRuby::CustomValidatorError, 'invalid has wrong format for check_format. Expect Regexp')
      end
      it 'invalid type' do
        type = Class.new do
          include CustomValidatorRuby
          attr_accessor :name
          validate :name, type: 'invalid'

          def initialize(attr={})
            @name = attr[:name]
          end
        end
        expect { type.new(name: 'Name').validate!}.to raise_error(CustomValidatorRuby::CustomValidatorError, 'invalid is wrong value for check_type. Expect Class name')
      end

      it 'invalid presence' do
        presence = Class.new do
          include CustomValidatorRuby
          attr_accessor :name
          validate :name, presence: 'invalid'

          def initialize(attr={})
            @name = attr[:name]
          end
        end
        expect { presence.new(name: 'Name').validate!}.to raise_error(CustomValidatorRuby::CustomValidatorError, 'invalid is unknown value for check_presence')
      end
    end
  end

  describe '#valid?' do
    context 'success' do
      it 'valid' do
        result = @validator.new(name: 'Name', age: 14)
        expect(result.valid?).to be_truthy
      end
    end

    context 'failed' do
      it 'invalid age' do
        result = @validator.new(name: 'Name', age: nil)
        expect(result.valid?).to be_falsey
      end
      it 'invalid name' do
        result = @validator.new(age: 14)
        expect(result.valid?).to be_falsey
      end
    end
  end

end
