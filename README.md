# Usagewatch

A Ruby Class with methods to find usage statistics on a Linux server such as CPU, Disk, TCP/UDP
Connections, Load, Bandwidth, Disk I/O, and Memory

## Installation

Add this line to your application's Gemfile:

    gem 'usagewatch'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install usagewatch

## Usage

```ruby
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
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Notes

* Disk Used is a sum of all partitions calculated in Gigabytes

* Disk Used Percentage is a total percentage of all disk partitions used

* CPU Used is a percentage of current CPU being used

* TCP/UDP Connections Used is a total count of each respectively

* Active Memory Used is a percentage of active system memory being used

* Load is the average load of the past minute

* Bandwidth is current received and transmitted in Megabits

* Disk IO is current disk reads and writes completed per second

## Tested Using

RUBY VERSIONS: ruby 1.9.3p429 (2013-05-15) [x86_64-linux], ruby2.0

OS VERSIONS: CENTOS 5x 6x, Ubuntu 12.04
