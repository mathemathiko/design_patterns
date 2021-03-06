class Report
  attr_reader :title, :text, :formatter

  def initialize(&formatter)
    @title     = 'Monthly Report'
    @text      = [ 'Good', 'The Best' ]
    @formatter = formatter
  end

  def output_report
    self.formatter.call(self)
  end
end

HTML_FORMATTER = lambda do |context|
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

PLAIN_TEXT_FORMATTER = lambda do |context|
  puts "***** #{context.title} *****"

  context.text.each do |line|
    puts line
  end
end

report = Report.new &HTML_FORMATTER
report.output_report
