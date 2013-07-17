# usagewatch

License: (MIT) Copyright (C) 2013 Author Phil Chen, Contributor Ruben Espinosa.

## DESCRIPTION:

A Ruby Class with methods to find usage statistics on a Linux server such as CPU, Disk, TCP/UDP Connections, Load, 
Bandwidth, Disk I/O, and Memory

## Getting Started

gem install usagewatch

```ruby
require 'usagewatch'

include Usagewatch

uw_diskused
uw_diskused_perc
uw_cpuused
uw_tcpused
uw_udpused
uw_memused
uw_load
uw_bandrx
uw_bandtx
uw_diskioreads
uw_diskiowrites
```

## Example

```bash
Run:

example.rb

Example Output:

11.56 Gigabytes Disk Used
7.0% Disk Used
0.25% CPU Used
30 TCP Connections Used
0 UDP Connections Used
43% Active Memory Used
0.01 Average System Load Of The Past Minute
0.008 Mbit/s Current Bandwidth Received
0.2 Mbit/s Current Bandwidth Transmitted
0/s Current Disk Reads Completed
2/s Current Disk Writes Completed
```

## Notes

Disk Used is a sum of all partitions calculated in Gigabytes

Disk Used Percentage is a total percentage of all disk partitions used

CPU Used is a percentage of current CPU being used

TCP/UDP Connections Used is a total count of each respectively

Active Memory Used is a percentage of active system memory being used

Load is the average load of the past minute

Bandwidth is current received and transmitted in Megabits

Disk IO is current disk reads and writes completed per second

## Tested Using

RUBY VERSIONS:
ruby 1.9.3p429 (2013-05-15) [x86_64-linux]

OS VERSIONS:
CENTOS 5x 6x
