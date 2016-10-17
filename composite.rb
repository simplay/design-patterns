class Tree
  def initialize(state)
    @state = state
    @subtrees = []
  end

  def add(tree)
    @subtrees << tree
  end

  def show(level = 0)
    puts "Assembling: #{@state}"
    indentation = " " * level + "+ "
    @subtrees.each do |tree|
      print indentation
      tree.show(level + 1)
    end
  end
  
end

class Wheel < Tree
  def initialize(id)
    super("#{id} Wheel")
  end
end

class Body < Tree
  def initialize
    super("Body")
  end
end

class Engine < Tree
  def initialize
    super("Engine")
  end
end

class Car < Tree
  def initialize(id)
    super("Car + #{id}")
  end
end

car = Car.new("Foobar1337")
engine = Engine.new
body = Body.new
wheel_11 = Wheel.new("Fron Left Wheel")
wheel_12 = Wheel.new("Fron Right Wheel")
wheel_21 = Wheel.new("Back Left Wheel")
wheel_22 = Wheel.new("Back Right Wheel")

car.add(body)
car.add(engine)

body.add(wheel_11)
body.add(wheel_12)
body.add(wheel_21)
body.add(wheel_22)

car.show


