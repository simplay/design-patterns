require 'pry'
class Singleton
  def self.instance
    # use class instance variables instead of class variables
    # since class variables behave non-intuitive:
    # their scope is in class hierarchy.
    @instance ||= self.send(:new)
  end

  def self.report
    puts "Singleton was created at: #{instance.created_at}"
  end

  private_class_method :new

  attr_reader :created_at

  def initialize
    @created_at = Time.now
  end

end

Singleton.report
binding.pry
