TracePoint.trace(:call, :return) do |tp|
  p [tp.lineno, tp.event, tp.method_id]
end

def say
  'hello'
end

say
