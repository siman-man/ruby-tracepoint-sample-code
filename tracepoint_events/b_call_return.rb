TracePoint.trace(:b_call, :b_return) do |tp|
  p [tp.lineno, tp.event]
end

[1, 2, 3].each do |n|
  p n
end
