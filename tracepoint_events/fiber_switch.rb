TracePoint.trace(:fiber_switch) do |tp|
  p [tp.lineno, tp.event]
end

f = Fiber.new do
  n = 0

  loop do
    Fiber.yield(n)
    n += 1
  end
end

3.times do
 p f.resume
end
