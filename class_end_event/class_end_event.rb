TracePoint.trace(:class, :end) do |tp|
  p [tp.lineno, tp.event]
end

class A
  def say
  end
end
