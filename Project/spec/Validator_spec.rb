#../spec/account_spec.rb
require_relative "../SingleControllers/Validator"
require 'rspec'

describe Validator do

    it 'recognizes correct date' do
        Validator.birthdate?(Date.new(1991, 12, 3)).should eq true
    end

    it 'recognizes 1991-12-03' do
        Validator.birthdate?("1991-12-03").should eq true
    end

    it 'recognizes 17.12.1991' do
        Validator.birthdate?("17.12.1991").should eq true
    end

    it 'recognizes 09.08.1972' do
        Validator.birthdate?("09.08.1972").should eq true
    end

    it 'recognizes 09.08.1972' do
        Validator.validate_birthdate("09.08.1972").should eq true
    end

    it 'does not recognizes 17.12.19911' do
        Validator.birthdate?("17.12.19911").should eq false
    end

  it 'validates 1991-12-03' do
    Validator.validate_birthdate("1991-12-03").should be_instance_of(Date)
  end


  it 'validates 17.12.1991' do
    Validator.validate_birthdate("17.12.1991").should be_instance_of(Date)
  end

  it 'recognizes 7-936-6746491' do
    Validator.phone?("7-936-6746491").should eq true
  end

  it 'validates 7-936-6746491' do
    Validator.validate_phone("7-936-6746491").should eq "7-936-6746491"
  end

end