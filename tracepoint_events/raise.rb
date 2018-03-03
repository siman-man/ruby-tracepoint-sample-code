TracePoint.trace(:raise) do |tp|
  p [tp.lineno, tp.event, tp.raised_exception]
end

raise 'error'
