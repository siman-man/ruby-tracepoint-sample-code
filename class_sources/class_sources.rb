module ClassSource
  @lines_for_file = {}
  @locations = Hash.new { |h, k| h[k] = [] }
  @pos_stack = []

  TracePoint.trace(:class, :end) do |tp|
    next if tp.self == ClassSource
    @lines_for_file[tp.path] ||= File.readlines(tp.path)

    case tp.event
    when :class
      @pos_stack << tp.lineno - 1
    when :end
      from, to = @pos_stack.pop, tp.lineno - 1
      source = @lines_for_file[tp.path][from..to].join
      @locations[tp.self] << { path: tp.path, from: from, to: to, source: source }
    end
  end

  def self.locations(klass)
    @locations[klass]
  end
end

class Object
  def source_locations
    ClassSource.locations(self)
  end
end

class A
  def say
    "hi"
  end
end

A.source_locations.each do |data|
  puts "#{data[:path]}##{data[:from]}"
  puts "-" * 30
  puts data[:source]
  puts "-" * 30
end
