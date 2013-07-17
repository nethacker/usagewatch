#!/usr/bin/ruby

#License: (MIT), Copyright (C) 2013 Author Phil Chen.

require 'usagewatch'

include Usagewatch

puts "#{uw_diskused} Gigabytes Used"
puts "#{uw_cpuused}% CPU Used"
puts "#{uw_tcpused} TCP Connections Used"
puts "#{uw_udpused} UDP Connections Used"
puts "#{uw_memused}% Active Memory Used"
puts "#{uw_load} Average System Load Of The Past Minute"
puts "#{uw_bandrx} Mbit/s Current Bandwidth Received"
puts "#{uw_bandtx} Mbit/s Current Bandwidth Transmitted"
puts "#{uw_diskioreads}/s Current Disk Reads Completed"
puts "#{uw_diskiowrites}/s Current Disk Writes Completed"
