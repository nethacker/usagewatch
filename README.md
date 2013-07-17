# Usagewatch

TODO: Write a gem description

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
