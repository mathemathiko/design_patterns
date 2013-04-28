class Report
  attr_reader :title, :text, :formatter

  def initialize(formatter)
    @title     = 'Monthly Report'
    @text      = [ 'Good', 'The Best' ]
    @formatter = formatter
  end

  def output_report
    self.formatter.output_report(title, text)
  end
end

class Formatter
  def output_report(title, text)
    raise 'Abstract method called'
  end
end

class HTMLFormatter < Formatter
  def output_report(title, text)
    puts '<html>'
    puts '  <head>'
    puts "    <title>#{@title}</title>"
    puts '  </head>'
    puts '  <body>'

    text.each do |line|
      puts "    <p>#{line}</p>"
    end

    puts '  </body>'
    puts '</html>'
  end
end

class PlainTextFormatter < Formatter
  def output_report(title, text)
    puts "***** #{@title} *****"

    text.each do |line|
      puts line
    end
  end
end

report = Report.new(HTMLFormatter.new)
report.output_report
