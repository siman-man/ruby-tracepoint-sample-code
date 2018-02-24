TracePoint.trace(:line) do |tp|
  puts "#{tp.binding.eval('__LINE__')}: exec"
end

a = 1
b = 2
c = 3
