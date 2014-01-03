class SlickButton
  attr_accessor :command

  def initialize(&command)
    @command = command
  end

  def on_button_push
    @command.call if @command
  end
end

save_button = SlickButton.new do
end
