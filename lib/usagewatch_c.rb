#License: (MIT), Copyright (C) 2013 Author Phil Chen.

class DiskStorage

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
end
