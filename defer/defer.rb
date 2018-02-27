module Defer
  @proc_stack = Hash.new { |h, k| h[k] = [] }

  TracePoint.trace(:return) do |tp|
    next if tp.method_id == :defer

    key = "#{tp.defined_class}::#{tp.method_id}"

    while block = @proc_stack[key].pop
      block.call
    end
  end

  def self.regist_proc(key, &block)
    @proc_stack[key] << block
  end
end

module Kernel
  def defer(&block)
    b = caller_locations.first
    key = "#{self.class}::#{b.base_label}"
    Defer.regist_proc(key, &block)
  end
end

def count
  puts "counting"

  1.upto(10) do |i|
    defer { puts i }
  end

  puts "done"
end

count
