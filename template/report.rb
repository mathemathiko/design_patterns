class Report
  attr_reader :format

  def initialize(format)
    @title  = 'Monthly Report'
    @text   = [ 'Good', 'The Best' ]
    @format = format
  end

  def output_report
    format = self.format.to_sym

    case format
    when :plain
      puts "*** #{@title} ***"
    when :html
      puts '<html>'
      puts '  <head>'
      puts "  <title>#{@title}</title>"
      puts '  </head>'
      puts '  <body>'
    else
      raise "Unknown format: #{format}"
    end

    @text.each do |line|
      case format
      when :plain
        puts line
      else
        puts "  <p>#{line}</p>"
      end
    end

    case format
    when :html
      puts '  </body>'
      puts '</html>'
    end
  end
end

report = Report.new(ARGV[0])
report.output_report
