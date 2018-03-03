TracePoint.trace(:c_call, :c_return) do |tp|
  p [tp.lineno, tp.event, tp.method_id]
end

100.to_s
