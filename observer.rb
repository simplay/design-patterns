require 'pry'

class Observer

  def initialize(identifier)
    @identifier = identifier
  end

  def report_status(message)
    puts "#{@identifier}: #{message}"
  end
end

class Subject
  def initialize
    @observers = []
    @counter = 0
  end

  # @param [#report_status]
  def subscribe(observer)
    @observers << observer
  end

  def unsubscribe
  end

  def notify_all
    @observers.each do |observer|
      observer.report_status(@counter)
    end
  end

  def increment_counter
    @counter = @counter + 1
    notify_all
  end
end

subject = Subject.new
observer1 = Observer.new("O1")
observer2 = Observer.new("O2")

subject.subscribe(observer1)
subject.subscribe(observer2)

subject.increment_counter

