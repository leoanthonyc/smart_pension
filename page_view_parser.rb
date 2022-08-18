require_relative "scanner"
require_relative "repository"

class PageViewParser
  attr_reader :file

  def initialize(file)
    @file = file
  end

  def call
    scan_and_store
    output
  end
  
  private

  def scan_and_store
    scanner.each_line do |path, ip_address|
      repo.store(path, ip_address)
    end
  end

  def scanner
    @scanner ||= PageViewScanner.new(file)
  end

  def repo
    @repo ||= PageViewRepository.new
  end

  def output
    puts
    puts "SORT BY HITS DESC"
    repo.sort_by_hits.each { |h|
      puts "path: #{h[:path]} views: #{h[:hits]}"
    }

    puts
    puts "SORT BY UNIQUE_HITS DESC"
    repo.sort_by_unique_hits.each { |h|
      puts "path: #{h[:path]} unique_views: #{h[:unique_hits]}"
    }

    puts
  end
end
