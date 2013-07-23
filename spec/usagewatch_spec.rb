require 'rspec'
require 'spec_helper'

describe 'Version' do
  it 'should be the version number' do
    Usagewatch::VERSION.class.should be(String)
  end
end

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

describe 'TopCPUUsage' do
  it "should be an array of top cpu consumption proccesses " do
    a = Usagewatch.uw_cputop
    a.class.should be(Array )
    a.should_not be_nil
    a[0][0].class.should be String
    a[0][1].class.should be String
    a.count.should be == 10
  end
end

describe 'TopMEMUsage' do
  it "should be an array of top mem consumption proccesses " do
    a = Usagewatch.uw_cputop
    a.class.should be(Array )
    a.should_not be_nil
    a[0][0].class.should be String
    a[0][1].class.should be String
    a.count.should be == 10
  end
end

os = RUBY_PLATFORM
if os.include? "linux"

  describe '' do
    it 'should TCP Connections Used' do
      a = Usagewatch.uw_tcpused
      a.class.class.should be Integer
      a.should be >= 0
    end
  end

  describe '' do
    it 'should UDP Connections Used ' do
      a = Usagewatch.uw_udpused
      a.class.class.should be Integer
      a.should be >= 0
    end
  end


end

