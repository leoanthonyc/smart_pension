#!/usr/bin/env ruby

require_relative "scanner"
require_relative "repository"

file_path = ARGV[0]
if file_path.nil?
  STDERR.puts
  STDERR.puts "Please provide a log file"
  STDERR.puts "e.g. ./parser.rb log/webserver.log"
  STDERR.puts
  exit 1
end

begin
  file_handle = File.open(file_path)
rescue Errno::ENOENT
  STDERR.puts
  STDERR.puts "File #{file_path} does not exist!"
  STDERR.puts
  exit 1
end

repo = PageViewRepository.new
PageViewScanner.new(file_handle).each_line do |path, ip_address|
  repo.store(path, ip_address)
end

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
