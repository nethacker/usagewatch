module Usagewatch
  class Usagewatch
    # Show disk used in GB
    def uw_diskused
      df = `df -kl`
      sum = 0.00
      df.each_line.with_index do |line, line_index|
        next if line_index.eql? 0
        line = line.split(" ")
        next if line[0] =~ /localhost/  #ignore backup filesystem
        sum += ((line[2].to_f)/1024)/1024
      end
      sum.round(2)
    end

    # Show the percentage of disk used.
    def uw_diskused_perc
      df = `df -kl`
      total = 0.0
      used = 0.0
      df.each_line.with_index do |line, line_index|
        df.split(" ").last.to_f.round(2)
        next if line_index.eql? 0
        line = line.split(" ")
        next if line[0] =~ /localhost/ #ignore backup filesystem
        total  += ((line[3].to_f)/1024)/1024
        used   +=((line[2].to_f)/1024)/1024
      end
      ((used/total) * 100).round(2)
    end

    # todo
    #def uw_cpuused
    #
    #end

    # return hash of top ten proccesses by cpu consumption
    # example [["apache2", 12.0], ["passenger", 13.2]]
    def uw_cputop
      ps = `ps aux | awk '{print $11, $3}' | sort -k2nr  | head -n 10`
      array = []
      ps.each_line do |line|
        line = line.chomp.split(" ")
        array << [line.first.gsub(/[\[\]]/, ""), line.last]
      end
      array
    end

    # todo
    #def uw_tcpused
    #
    #end

    # todo
    #def uw_udpused
    #
    #end

    # return hash of top ten proccesses by mem consumption
    # example [["apache2", 12.0], ["passenger", 13.2]]
    def uw_memtop
      ps = `ps aux | awk '{print $11, $4}' | sort -k2nr  | head -n 10`
      array = []
      ps.each_line do |line|
        line = line.chomp.split(" ")
        array << [line.first.gsub(/[\[\]]/, "").split("/").last, line.last]
      end
      array
    end

    #todo
    #def uw_memused
    #
    #end

    #todo
    #def uw_load
    #
    #end

    #todo
    #def uw_bandrx
    #
    #end

    #todo
    #def uw_bandtx
    #
    #end

    #todo
    #def uw_diskioreads
    #
    #end

    #todo
    #def uw_diskiowrites
    #
    #end
  end
end