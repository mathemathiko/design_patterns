require 'forwardable'

class Task
  attr_reader :name, :parent

  def initialize(name)
    @name   = name
    @parent = nil
  end

  def get_time_required
    0.0
  end
end

class CompositeTask < Task
  def_delegators :@sub_tasks, :[], :[]=

  def initialize(name)
    super name
    @sub_tasks = []
  end

  def <<(task)
    @sub_tasks << task
    task.parent = self
  end

  def delete(task)
    @sub_tasks.delete(task)
    task.parent = nil
  end

  def get_time_required
    @sub_tasks.sum(&:get_time_required)
  end
end

class AddDryIngredientsTask < Task
  def initialize
    super "Add dry ingredients"
  end

  def get_time_required
    1.0
  end
end

class MixTask < Task
  def initialize
    super "Mix that batter up!"
  end

  def get_time_required
    3.0
  end
end

class MakeBatterTask < CompositeTask
  def initialize
    super "Make batter"
    self << AddDryIngredientsTask.new
    self << MixTask.new
  end
end
