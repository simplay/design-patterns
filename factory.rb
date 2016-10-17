require 'pry'

class Hero
  def initialize(name)
    @name = name
  end

  def yell
    puts "The #{self.class.to_s} #{@name} is Rooaring!"
  end
end

class Warrior < Hero
  def initialize(name)
    super(name)
  end
end

class Mage < Hero
  def initialize(name)
    super(name)
  end
end

class Mount
  def initialize(name)
    @name = name
  end

  def mount
    puts "You are mounting a #{self.class.to_s} named #{@name}"
  end
end

class Griffin < Mount
  def initialize(name)
    super(name)
  end
end

class Dragon < Mount
  def initialize(name)
    super(name)
  end
end

class DragonMageFactory
  def new_mount(name)
    Dragon.new(name)
  end

  def new_class(name)
    Mage.new(name)
  end
end

class GriffinWarriorFactory
  def new_mount(name)
    Griffin.new(name)
  end

  def new_class(name)
    Warrior.new(name)
  end
end

class Realm
  def initialize(class_count, mount_count, factory)
    @factory = factory
    
    @heros = []
    class_count.times do |i|
      hero = @factory.new_class("Hero #{i}")
      @heros << hero
    end

    @mounts = []
    mount_count.times do |i|
      mount = @factory.new_mount("Mount #{i}")
      @mounts << mount
    end
  end

  def simulate_battle
    @heros.each(&:yell)
    @mounts.each(&:mount)
  end
end

mounted_warriors = Realm.new(2, 3, GriffinWarriorFactory.new)
mounted_warriors.simulate_battle
puts ""
mounted_warriors = Realm.new(3, 4, DragonMageFactory.new)
mounted_warriors.simulate_battle

binding.pry
