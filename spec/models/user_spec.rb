require 'spec_helper'

describe User do 
  it { should validate_presence_of :email }
  it { should have_secure_password }
  it { should have_many :urls }
end