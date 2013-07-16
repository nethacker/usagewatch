#!/usr/bin/ruby

#License: (MIT), Copyright (C) 2013 Author Phil Chen.

require './lib/usagewatch_class'

u = UsageWatch.new

puts "#{u.uw_diskused} Gigabytes Disk Used"
puts "#{u.uw_diskused_perc}% Disk Used"
puts "#{u.uw_cpuused}% CPU Used"
puts "#{u.uw_tcpused} TCP Connections Used"
puts "#{u.uw_udpused} UDP Connections Used"
puts "#{u.uw_memused}% Active Memory Used"
puts "#{u.uw_load} Average System Load Of The Past Minute"
puts "#{u.uw_bandrx} Mbit/s Current Bandwidth Received"
puts "#{u.uw_bandtx} Mbit/s Current Bandwidth Transmitted"
puts "#{u.uw_diskioreads}/s Current Disk Reads Completed"
puts "#{u.uw_diskiowrites}/s Current Disk Writes Completed"
