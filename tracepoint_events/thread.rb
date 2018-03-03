TracePoint.trace(:thread_begin, :thread_end) do |tp|
  p tp.event
end

thr = Thread.new { puts 'Hello World!' }
thr.join
