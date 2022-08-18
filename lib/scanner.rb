class Scanner
  attr_reader :handle

  def initialize(handle)
    @handle = handle
  end

  def each_line
    raise "Not Implemented"
  end
end

class PageViewScanner < Scanner
  def each_line
    handle.each_line do |line|
      path, ip_address = line.split(" ")
      yield path, ip_address
    end
  end
end
