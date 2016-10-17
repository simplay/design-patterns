require 'pry'

class Engine
  def to_s
    "Engine"
  end

  def accept(visitor)
    visitor.visit(self)
  end
end

class Body
  def to_s
    "Body"
  end

  def accept(visitor)
    visitor.visit(self)
  end
end

class Wheel
  def initialize(identifier)
    @identifier = identifier
  end

  def to_s
    @identifier.to_s
  end

  def accept(visitor)
    visitor.visit(self)
  end
end

class Car
  def initialize(id)
    @id = id
    @parts = [
      Engine.new,
      Body.new,
      Wheel.new("Front Right"),
      Wheel.new("Front Left"),
      Wheel.new("Back Right"),
      Wheel.new("Back Left")
    ]
  end

  def accept(visitor)
    visitor.visit(self)
    @parts.each do |part|
      part.accept(visitor)
    end
  end

  def to_s
    "Model Nr. #{@id}"
  end

end

class CarPartVisitor
  def visit(part)
    suffix = part.class.to_s.downcase
    method_name = "visit_#{suffix}"
    send(method_name, part)
  end

  private

  def visit_engine(part)
    puts "Visiting #{part.to_s}"
  end

  def visit_body(part)
    puts "Visiting #{part.to_s}"
  end

  def visit_wheel(part)
    puts "Visiting #{part.to_s} Wheel"
  end

  def visit_car(part)
    puts "Visiting Car #{part.to_s}"
  end
end


car = Car.new("Foobar1337")
car.accept(CarPartVisitor.new)

binding.pry
