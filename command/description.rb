class Command
  attr_reader :description

  def initialize(description)
    @description = description
  end

  def execute
    raise ArgumentError, "You need to overwrite this method."
  end

  def unexecute
    raise ArgumentError, "You need to overwrite this method."
  end
end

class CreateFile < Command
  def initialize(path, contents)
    super
    @path = path
    @contents = contents
  end

  def execute
    f = File.open(@path, "w")
    f.write(@contents)
    f.close
  end

  def unexecute
    File.delete(@path)
  end
end

class DeleteFile < Command
  def initialize(path)
    super
    @path = path
  end

  def execute
    if File.exists?(@path)
      @contents = File.read(@path)
    end

    File.delete(@path)
  end

  def unexecute
    if @contents
      f = File.open(@path, "w")
      f.write(@contents)
      f.close
    end
  end
end

class CopyFile < Command
  def initialize(source, target)
    super
    @source = source
    @target = target
  end

  def execute
    FileUtils.copy(@source, @target)
  end
end

class CompositeCommand < Command
  def initialize
    @commands = []
  end

  def add_command(cmd)
    @commands << cmd
  end

  def execute
    @commands.each {|cmd| cmd.execute }
  end

  def unexecute
    @commands.each {|cmd| cmd.unexecute }
  end

  def description
    @commands.inject([]){|descriptions, cmd| descriptions << cmd.description; descriptions }.join("\n")
  end
end

cmds = CompositeCommand.new

cmds.add_command(CreateFile.new("file1.txt", "hello world.\n"))
cmds.add_command(CopyFile.new("file1.txt", "file2.txt"))
cmds.add_command(DeleteFile.new("file1.txt"))

cmds.execute
