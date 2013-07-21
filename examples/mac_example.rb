#!/usr/bin/ruby

#License: (MIT), Copyright (C) 2013 Author Phil Chen, Contributor Ruben Espinosa

require 'usagewatch'

usw =  Usagewatch

puts "#{usw.uw_diskused} Gigabytes Used"
puts "#{usw.uw_diskused_perc} Gigabytes Used"
puts "#{usw.uw_cpuused}% CPU Used"
puts "#{usw.uw_load} Average System Load Of The Past Minute"
puts "Top Ten Processes By CPU Consumption: #{usw.uw_cputop}"
puts "Top Ten Processes By Memory Consumption: #{usw.uw_memtop}"
