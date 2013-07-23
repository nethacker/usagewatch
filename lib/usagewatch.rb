#License: (MIT), Copyright (C) 2013 Author Phil Chen, contributor Ruben Espinosa

require "usagewatch/version"

os = RUBY_PLATFORM
text =  "Unsupported OS!"

if os.include? "linux"
  require "usagewatch/linux"
else
   puts text
end
