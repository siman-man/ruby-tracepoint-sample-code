require 'coverage'

Coverage.start(lines: true)
require_relative 'fizzbuzz'
result = Coverage.result

result.each do |filepath, coverage_data|
  count_list = coverage_data[:lines]
  puts '-' * 80
  count_list.zip(File.readlines(filepath)).each do |count, line|
    puts "#{count.to_s.rjust(10)}: #{line}"
  end
  puts '-' * 80
end
