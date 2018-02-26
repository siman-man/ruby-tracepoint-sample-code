require 'coverage'

class TCoverage
  def self.start(&block)
    coverage_data = Hash.new { |h, k| h[k] = {} }

    trace = TracePoint.new(:line) do |tp|
      coverage_data[tp.path][:lines] ||= Array.new(%x{wc -l #{tp.path}}.split.first.to_i)
      coverage_data[tp.path][:lines][tp.lineno - 1] ||= 0
      coverage_data[tp.path][:lines][tp.lineno - 1] += 1
    end

    trace.enable(&block)

    coverage_data
  end
end
