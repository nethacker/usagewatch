# usagewatch

License: (MIT) Copyright (C) 2013 Phil Chen.

## DESCRIPTION:

A Ruby Class with methods to find usage statistics on a Linux server such as CPU, Disk, Connections, Load, and Memory

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
u.diskused
u.cpuused
```

The Class is located at lib/usagewatch_class.rb

## Notes

Disk Used is a sum of all partitions calculated in Gigabytes

CPU Used is a Percentage
