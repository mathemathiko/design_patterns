class Report
  attr_reader :title, :text, :formatter

  def initialize(formatter)
    @title     = 'Monthly Report'
    @text      = [ 'Good', 'The Best' ]
    @formatter = formatter
  end

  def output_report
    self.formatter.output_report(self)
  end
end

class HTMLFormatter
  def output_report(context)
    puts '<html>'
    puts '  <head>'
    puts "    <title>#{context.title}</title>"
    puts '  </head>'
    puts '  <body>'

    context.text.each do |line|
      puts "    <p>#{line}</p>"
    end

    puts '  </body>'
    puts '</html>'
  end
end

class PlainTextFormatter
  def output_report(context)
    puts "***** #{context.title} *****"

    context.text.each do |line|
      puts line
    end
  end
end

report = Report.new(HTMLFormatter.new)
report.output_report
