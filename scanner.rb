class Scanner
  attr_reader :handle

  def initialize(handle)
    @handle = handle
  end

  def each_entry
    raise "Not Implemented"
  end
end

class PageVisitScanner < Scanner
  def each_entry
    handle.each_line do |line|
      path, ip_address = line.split(" ")
      yield path, ip_address
    end
  end
end
