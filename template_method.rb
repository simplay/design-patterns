require 'pry'

# The Template Pattern
#
# Rather have a default implementation instead of raising
# an exception within template method's body.
class RawTextReporter

  # @param [String] title header message
  # @param [#each] content body messages
  def initialize(title, content)
    @title = title
    @content = content
    @type = self.class.to_s
    @footer = "this is the footer"
  end

  def print_message
    puts "Printing header of #{@type}:\n"
    print_header
    print_body
    print_footer
  end

  def print_header
    puts @title
  end

  def print_body
    @content.each do |item|
      puts item
    end
  end

  def print_footer
    puts @footer
  end

end

class HtmlReporter < RawTextReporter
  
  def print_header
    puts "<head>#{@title}<\\head>"
  end

  def print_body
    puts "<body>"
    @content.each do |item|
      puts "<p>item<\\p>" 
    end
    puts "<\\body>"
  end

  def print_footer
    puts "<footer>#{@footer}<\\footer>"
  end
end

class YamlReporter < RawTextReporter
  def print_header
    puts "header: #{@title}"
  end

  def print_body
    @content.each_with_index do |item, idx|
      puts "item_#{idx}: #{item}"
    end
  end

  def print_footer
    puts "footer: #{@footer}"
  end
end

title = "Magic Unicorn Song"
# Generated using https://www.rappad.co/songs-about
content = [
  "But in real life they eyes is on your moneysee the enemies will say they true.",
  "It's apparent you're transparent, you're fake, unicorns are realer than you."
]
RawTextReporter.new(title, content).print_message
puts ""
HtmlReporter.new(title, content).print_message
puts ""
YamlReporter.new(title, content).print_message

binding.pry
