require 'rspec'
require 'spec_helper'

describe 'IncludeLibrary' do
  it 'should include the library' do
    a = Usagewatch
    a.should be Usagewatch
  end
end

describe 'DiskUsage' do
  it "should be the GB of disk used" do
    a = Usagewatch.uw_diskused
    a.class.should be(Float)
    a.should_not be_nil
    a.should be >= 0
  end
end

describe 'CPUUsage' do
  it "should be the percentage of cpu used" do
    a = Usagewatch.uw_cpuused
    a.class.should be(Float)
    a.should_not be_nil
    a.should be <= 100
    a.should be >= 0
  end
end

describe 'PercentageDiskUsage' do
  it "should be the percentage of GB of disk used" do
    a = Usagewatch.uw_diskused_perc
    a.class.should be(Float)
    a.should_not be_nil
    a.should be <= 100
    a.should be >= 0
  end
end
