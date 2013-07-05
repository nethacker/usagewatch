# usagewatch

License: (MIT) Copyright (C) 2013 Phil Chen.

## DESCRIPTION:

A Ruby Class with methods to find usage statistics on a Linux server such as CPU, Disk, TCP/UDP Connections, Load, and Memory

## Getting Started

To see an example of usage data run example.rb

Or

Require the library:

```ruby
require './lib/usagewatch_class'
```

Create a new UsageWatch object:

```ruby
u = UsageWatch.new
u.uw_diskused
u.uw_cpuused
u.uw_tcpused
u.uw_udpused
u.uw_memused
u.uw_load
```

The Class is located at lib/usagewatch_class.rb

## Notes

Disk Used is a sum of all partitions calculated in Gigabytes

CPU Used is a percentage of current CPU being used

TCP/UDP Connections Used is a total count of each respectively

Active Memory Used is a percentage of active system memory being used

Load is the average load of the past minute

## Tested Using

ruby 1.9.3p429 (2013-05-15) [x86_64-linux]

