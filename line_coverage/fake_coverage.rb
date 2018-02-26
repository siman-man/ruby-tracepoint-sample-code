require_relative 'tracepoint_coverage'

result = TCoverage.start do
  require_relative 'fizzbuzz'
end

result.each do |filepath, coverage_data|
  next if filepath == __FILE__

  count_list = coverage_data[:lines]
  puts '-' * 80
  count_list.zip(File.readlines(filepath)).each do |count, line|
    puts "#{count.to_s.rjust(10)}: #{line}"
  end
  puts '-' * 80
end
