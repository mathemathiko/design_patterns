class Duck
  def initialize(name)
    @name = name
  end

  def eat
    puts "#{self.class.name} #{@name} is eating."
  end

  def speak
    puts "#{self.class.name} #{@name} is speaking."
  end

  def sleep
    puts "#{self.class.name} #{@name} is sleeping."
  end
end

class Frog
  def initialize(name)
    @name = name
  end

  def eat
    puts "#{self.class.name} #{@name} is eating."
  end

  def speak
    puts "#{self.class.name} #{@name} is speaking."
  end

  def sleep
    puts "#{self.class.name} #{@name} is sleeping."
  end
end

class Tiger
  def initialize(name)
    @name = name
  end

  def eat
    puts "#{self.class.name} #{@name} is eating."
  end

  def speak
    puts "#{self.class.name} #{@name} is speaking."
  end

  def sleep
    puts "#{self.class.name} #{@name} is sleeping."
  end
end

class Algae
  def initialize(name)
    @name = name
  end

  def grow
    puts "#{self.class.name} #{@name} grows."
  end
end

class WaterLily
  def initialize(name)
    @name = name
  end

  def grow
    puts "#{self.class.name} #{@name} grows."
  end
end

class Tree
  def initialize(name)
    @name = name
  end

  def grow
    puts "#{self.class.name} #{@name} grows."
  end
end

class Pond
  def initialize(number_animals, number_plants, organism_factory)
    @organism_factory = organism_factory

    @animals = []
    number_animals.times do |i|
      animal = @organism_factory.new_animal "Animal#{i}"
      @animals << animal
    end

    @plants = []
    number_plants.times do |i|
      plant = @organism_factory.new_plant "Plant#{i}"
      @plants << plant
    end
  end

  def simulate_one_day
    @plants.each &:grow
    @animals.each &:speak
    @animals.each &:eat
    @animals.each &:sleep
  end
end

class PondOrganismFactory
  def self.new_animal(name)
    Frog.new name
  end

  def self.new_plant(name)
    WaterLily.new name
  end
end

class JungleOrganismFactory
  def self.new_animal(name)
    Tiger.new name
  end

  def self.new_plant(name)
    Tree.new name
  end
end

pond = Pond.new(3, 2, JungleOrganismFactory)
pond.simulate_one_day
