# RUBY_VERSION >= '2.6.0'
TracePoint.trace(:script_compiled) do |tp|
  pp [tp.lineno, tp.path, tp.instruction_sequence, tp.eval_script]
end

require 'set'
eval('1 + 1')
