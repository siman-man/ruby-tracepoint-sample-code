TracePoint.trace(:call) do |tp|
  args = tp.binding.local_variables

  args.each do |name|
    val = tp.binding.local_variable_get(name)

    if val.nil?
      loc = caller_locations.last
      code = File.readlines(tp.path)[loc.lineno - 1].chomp
      raise "Not use nil argument `#{code}'"
    end
  end
end

def say(message)
  puts message
end

say('hello')
say(nil)
say('world')
