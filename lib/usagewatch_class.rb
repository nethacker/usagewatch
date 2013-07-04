
#License: (MIT), Copyright (C) 2013 Author Phil Chen.

class UsageWatch
  def diskused
    @df = `df`
    @parts = @df.split(" ").map { |s| s.to_i }
    @sum = 0    
      for i in (9..@parts.size - 1).step(6) do
        @sum += @parts[i]
      end
    @round = @sum.round(2)
    @totaldiskused = ((@round/1024)/1024).round(2)

  return @totaldiskused
  end

  def cpuused
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

  return @cpuusagepercentage
  end

  def tcpused
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

  return @totaltcpused
  end

  def udpused
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

  return @totaludpused
  end

  def memused
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

  return @memusagepercentage
  end
end
