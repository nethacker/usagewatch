require 'rspec'
require 'spec_helper'

describe 'Version' do
  it 'should be the version number' do
    a = Usagewatch::VERSION
    a.class.should be(String)
    a.should_not be_nil
  end
end