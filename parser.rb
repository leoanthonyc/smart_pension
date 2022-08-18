#!/usr/bin/env ruby

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
