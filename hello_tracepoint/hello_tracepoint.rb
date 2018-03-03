TracePoint.trace do |tp|
  p tp
end

trace = TracePoint.new do |tp|
  p tp
end

trace.enable
trace.enabled? #=> true
trace.disable
trace.enabled? #=> false

