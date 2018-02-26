TracePoint.trace(:line) do |tp|
  puts "#{tp.lineno}: exec"
end

a = 1
b = 2
c = 3
