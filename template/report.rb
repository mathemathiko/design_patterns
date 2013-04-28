class Report
  attr_reader :format

  def initialize
    @title  = 'Monthly Report'
    @text   = [ 'Good', 'The Best' ]
  end

  def output_report
    output_start
    output_head
    output_body_start
    output_body
    output_body_end
    output_end
  end

  def output_body
    @text.each do |line|
      output_line line
    end
  end

  def output_start
    raise 'Called abstract mathod: output_start'
  end

  def output_head
    raise 'Called abstract mathod: output_head'
  end

  def output_body_start
    raise 'Called abstract mathod: output_body_start'
  end

  def output_line(line)
    raise 'Called abstract mathod: output_line'
  end

  def output_body_end
    raise 'Called abstract mathod: output_body_end'
  end

  def output_end
    raise 'Called abstract mathod: output_end'
  end
end

class HTMLReport < Report
  def output_start
    puts '<html>'
  end

  def output_head
    puts '  <head>'
    puts "  <title>#{@title}</title>"
    puts '  </head>'
  end

  def output_body_start
    puts '  <body>'
  end

  def output_line(line)
    puts "  <p>#{line}</p>"
  end

  def output_body_end
    puts '  </body>'
  end

  def output_end
    puts '</html>'
  end
end

report = HTMLReport.new
report.output_report

class PlainTextReport < Report
  def output_start
  end

  def output_head
    puts "*** #{@title} ***"
    puts
  end

  def output_body_start
  end

  def output_line(line)
    puts line
  end

  def output_body_end
  end

  def output_end
  end
end

report = PlainTextReport.new
report.output_report
