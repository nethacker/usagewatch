#License: (MIT), Copyright (C) 2013 Author Phil Chen, contributor Ruben Espinosa

require "usagewatch/version"

os = RUBY_PLATFORM
text =  "Unsupported OS! If you are using a Operating System that is not Linux, please try out the Gem usagewatch_ext by Ruben Espinosa" 

if os.include? "linux"
  require "usagewatch/linux"
else
   puts text
end
