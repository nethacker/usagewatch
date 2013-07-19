#License: (MIT), Copyright (C) 2013 Author Phil Chen, Contributor Ruben Espinosa

require "usagewatch/version"

os = RUBY_PLATFORM
text =  "OS is not supported in this version."

if os.include? "darwin"
  puts "Mac" + text
elsif os.include? "linux"
  require "usagewatch/linux"
elsif os =~ /cygwin|mswin|mingw|bccwin|wince|emx/
  puts "Windows" + text
else
   puts "This" + text
end



