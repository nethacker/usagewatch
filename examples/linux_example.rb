#!/usr/bin/ruby

#License: (MIT), Copyright (C) 2013 Author Phil Chen, Contributor Ruben Espinosa

require 'usagewatch'

usw =  Usagewatch

puts "#{usw.uw_diskused} Gigabytes Used"
puts "#{usw.uw_diskused_perc} Perventage of Gigabytes Used"
puts "#{usw.uw_cpuused}% CPU Used"
puts "#{usw.uw_tcpused} TCP Connections Used"
puts "#{usw.uw_udpused} UDP Connections Used"
puts "#{usw.uw_memused}% Active Memory Used"
puts "#{usw.uw_load} Average System Load Of The Past Minute"
puts "#{usw.uw_bandrx} Mbit/s Current Bandwidth Received"
puts "#{usw.uw_bandtx} Mbit/s Current Bandwidth Transmitted"
puts "#{usw.uw_diskioreads}/s Current Disk Reads Completed"
puts "#{usw.uw_diskiowrites}/s Current Disk Writes Completed"
puts "Top Ten Processes By CPU Consumption: #{usw.uw_cputop}"
puts "Top Ten Processes By Memory Consumption: #{usw.uw_memtop}"
