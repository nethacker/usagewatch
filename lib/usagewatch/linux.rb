# License: (MIT), Copyright (C) 2013 usagewatch Author Phil Chen, contributor Ruben Espinosa

module Usagewatch
  # Show the amount of total disk used in Gigabytes
  def self.uw_diskused
    @df = `df`
    @parts = @df.split(" ").map { |s| s.to_i }
    @sum = 0
    for i in (9..@parts.size - 1).step(6) do
      @sum += @parts[i]
    end
    @round = @sum.round(2)
    @totaldiskused = ((@round/1024)/1024).round(2)
  end

  # Show the percentage of disk used.
  def self.uw_diskused_perc
    df = `df --total`
    parts = df.split(" ")
    perc = parts.last
    if perc == "-" # ubuntu adds - for path instead of blank like others.
      perc = parts[-2]
    end
    perc.to_f.round(2)
  end

  # Show the percentage of CPU used
  def self.uw_cpuused
    @proc0 = File.readlines('/proc/stat').grep(/^cpu /).first.split(" ")
    sleep 1
    @proc1 = File.readlines('/proc/stat').grep(/^cpu /).first.split(" ")

    @proc0usagesum = @proc0[1].to_i + @proc0[2].to_i + @proc0[3].to_i
    @proc1usagesum = @proc1[1].to_i + @proc1[2].to_i + @proc1[3].to_i
    @procusage = @proc1usagesum - @proc0usagesum

    @proc0total = 0
    for i in (1..4) do
      @proc0total += @proc0[i].to_i
    end
    @proc1total = 0
    for i in (1..4) do
      @proc1total += @proc1[i].to_i
    end
    @proctotal = (@proc1total - @proc0total)

    @cpuusage = (@procusage.to_f / @proctotal.to_f)
    @cpuusagepercentage = (100 * @cpuusage).to_f.round(2)
  end

  # return hash of top ten proccesses by cpu consumption
  # example [["apache2", 12.0], ["passenger", 13.2]]
  def self.uw_cputop
    ps = `ps aux | awk '{print $11, $3}' | sort -k2nr  | head -n 10`
    array = []
    ps.each_line do |line|
      line = line.chomp.split(" ")
      array << [line.first.gsub(/[\[\]]/, ""), line.last]
    end
    array
  end

  # Show the number of TCP connections used
  def self.uw_tcpused
    if File.exists?("/proc/net/sockstat")
      File.open("/proc/net/sockstat", "r") do |ipv4|
        @sockstat = ipv4.read
      end

      @tcp4data = @sockstat.split
      @tcp4count = @tcp4data[5]
    end

    if  File.exists?("/proc/net/sockstat6")
      File.open("/proc/net/sockstat6", "r") do |ipv6|
        @sockstat6 = ipv6.read

      end

      @tcp6data = @sockstat6.split
      @tcp6count = @tcp6data[2]
    end

    @totaltcpused = @tcp4count.to_i + @tcp6count.to_i
  end

  # Show the number of UDP connections used
  def self.uw_udpused
    if File.exists?("/proc/net/sockstat")
      File.open("/proc/net/sockstat", "r") do |ipv4|
        @sockstat = ipv4.read
      end

      @udp4data = @sockstat.split
      @udp4count = @udp4data[16]
    end

    if File.exists?("/proc/net/sockstat6")
      File.open("/proc/net/sockstat6", "r") do |ipv6|
        @sockstat6 = ipv6.read
      end

      @udp6data = @sockstat6.split
      @udp6count = @udp6data[5]
    end

    @totaludpused = @udp4count.to_i + @udp6count.to_i
  end

  # Show the percentage of Active Memory used
  def self.uw_memused
    if File.exists?("/proc/meminfo")
      File.open("/proc/meminfo", "r") do |file|
        @result = file.read
      end
    end

    @memstat = @result.split("\n").collect{|x| x.strip}
    @memtotal = @memstat[0].gsub(/[^0-9]/, "")
    @memactive = @memstat[5].gsub(/[^0-9]/, "")
    @memactivecalc = (@memactive.to_f * 100) / @memtotal.to_f
    @memusagepercentage = @memactivecalc.round
  end

  # return hash of top ten proccesses by mem consumption
  # example [["apache2", 12.0], ["passenger", 13.2]]
  def self.uw_memtop
    ps = `ps aux | awk '{print $11, $4}' | sort -k2nr  | head -n 10`
    array = []
    ps.each_line do |line|
      line = line.chomp.split(" ")
      array << [line.first.gsub(/[\[\]]/, ""), line.last]
    end
    array
  end

  # Show the average system load of the past minute
  def self.uw_load
    if File.exists?("/proc/loadavg")
      File.open("/proc/loadavg", "r") do |file|
        @loaddata = file.read
      end

      @load = @loaddata.split(/ /).first.to_f
    end
  end

  # Bandwidth Received Method
  def self.bandrx

    if File.exists?("/proc/net/dev")
      File.open("/proc/net/dev", "r") do |file|
        @result = file.read
      end
    end

    @arrRows = @result.split("\n")

    @arrEthLoRows = @arrRows.grep(/eth|lo/)

    rowcount = (@arrEthLoRows.count - 1)

    for i in (0..rowcount)
      @arrEthLoRows[i] = @arrEthLoRows[i].gsub(/\s+/m, ' ').strip.split(" ")
    end

    @arrColumns = Array.new
    for l in (0..rowcount)
      @temp = Array.new
      @temp[0] = @arrEthLoRows[l][1]
      @temp[1] = @arrEthLoRows[l][9]
      @arrColumns << @temp
    end

    columncount = (@arrColumns[0].count - 1)

    @arrTotal = Array.new
    for p in (0..columncount)
      @arrTotal[p] = 0
    end

    for j in (0..columncount)
      for k in (0..rowcount)
        @arrTotal[j] = @arrColumns[k][j].to_i + @arrTotal[j]
      end
    end

    @bandrxtx = @arrTotal
  end

  # Current Bandwidth Received Calculation in Mbit/s
  def self.uw_bandrx

    @new0 = self.bandrx
    sleep 1
    @new1 = self.bandrx

    @bytesreceived = @new1[0].to_i - @new0[0].to_i
    @bitsreceived = (@bytesreceived * 8)
    @megabitsreceived = (@bitsreceived.to_f / 1024 / 1024).round(3)
  end

  # Bandwidth Transmitted Method
  def self.bandtx

    if File.exists?("/proc/net/dev")
      File.open("/proc/net/dev", "r") do |file|
        @result = file.read
      end
    end

    @arrRows = @result.split("\n")

    @arrEthLoRows = @arrRows.grep(/eth|lo/)

    rowcount = (@arrEthLoRows.count - 1)

    for i in (0..rowcount)
      @arrEthLoRows[i] = @arrEthLoRows[i].gsub(/\s+/m, ' ').strip.split(" ")
    end

    @arrColumns = Array.new
    for l in (0..rowcount)
      @temp = Array.new
      @temp[0] = @arrEthLoRows[l][1]
      @temp[1] = @arrEthLoRows[l][9]
      @arrColumns << @temp
    end

    columncount = (@arrColumns[0].count - 1)

    @arrTotal = Array.new
    for p in (0..columncount)
      @arrTotal[p] = 0
    end

    for j in (0..columncount)
      for k in (0..rowcount)
        @arrTotal[j] = @arrColumns[k][j].to_i + @arrTotal[j]
      end
    end

    @bandrxtx = @arrTotal
  end

  # Current Bandwidth Transmitted in Mbit/s
  def self.uw_bandtx

    @new0 = self.bandtx
    sleep 1
    @new1 = self.bandtx

    @bytestransmitted = @new1[1].to_i - @new0[1].to_i
    @bitstransmitted = (@bytestransmitted * 8)
    @megabitstransmitted = (@bitstransmitted.to_f / 1024 / 1024).round(3)
  end

  # Disk Usage Method
  def self.diskio

    if File.exists?("/proc/diskstats")
      File.open("/proc/diskstats", "r") do |file|
        @result = file.read
      end
    end

    @arrRows = @result.split("\n")

    rowcount = (@arrRows.count - 1)

    for i in (0..rowcount)
      @arrRows[i] = @arrRows[i].gsub(/\s+/m, ' ').strip.split(" ")
    end

    @arrColumns = Array.new
    for l in (0..rowcount)
      @temp = Array.new
      @temp[0] = @arrRows[l][3]
      @temp[1] = @arrRows[l][7]
      @arrColumns << @temp
    end

    columncount = (@arrColumns[0].count - 1)

    @arrTotal = Array.new
    for p in (0..columncount)
      @arrTotal[p] = 0
    end

    for j in (0..columncount)
      for k in (0..rowcount)
        @arrTotal[j] = @arrColumns[k][j].to_i + @arrTotal[j]
      end
    end

    @diskiorw= @arrTotal
  end

  # Current Disk Reads Completed
  def self.uw_diskioreads

    @new0 = self.diskio
    sleep 1
    @new1 = self.diskio

    @diskreads = @new1[0].to_i - @new0[0].to_i
  end

  # Current Disk Writes Completed
  def self.uw_diskiowrites

    @new0 = self.diskio
    sleep 1
    @new1 = self.diskio

    @diskwrites = @new1[1].to_i - @new0[1].to_i
  end
end
