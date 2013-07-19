#License: (MIT), Copyright (C) 2013 Author Phil Chen, Contributor Ruben Espinosa

require "usagewatch/version"

os = RUBY_PLATFORM

if os.include?("darwin")
  #require "usagewatch/usagewatch"
  require File.join(File.dirname(__FILE__), 'usagewatch', 'usagewatch')
else
  puts "This OS is not supported in this version."
end