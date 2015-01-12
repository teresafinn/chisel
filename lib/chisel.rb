require_relative 'text'
require_relative 'list'
require_relative 'messages'

class Chisel

  def initialize
    @messages = Messages.new
    @text = Text.new
    @list = List.new
  end

  def separate_string(document)
    document.split("\n\n")
  end

  def classify(separated)
    case 
      when separated.start_with?("# ") then @text.h1_tags(separated)
      when separated.start_with?("## ") then @text.h2_tags(separated)
      when separated.start_with?("### ") then @text.h3_tags(separated)
      when separated.start_with?("#### ") then @text.h4_tags(separated)
      when separated.start_with?("##### ") then @text.h5_tags(separated)
      when separated.start_with?("###### ") then @text.h6_tags(separated)
      when separated.start_with?("* ") then @list.unord_list(separated)
      when separated.start_with?("1.") then @list.ord_list(separated)
      else @text.p_tags(separated)
    end
  end

  def convert_to_html(input)
    input.map { |e| classify(e) }
  end


  def parse(document)
    chunked_doc = separate_string(document)
    convert_to_html(chunked_doc).join("\n")
  end

end

puts "Welcome to Chisel! I would be happy to help you convert your markdown input into HTML. Please enter your markdown conversion request, and then hit enter and type 'END'. I will immediately output HTML."

$/ = "END"  
user_input = STDIN.gets
chisel = Chisel.new
puts chisel.parse(user_input)
puts "Thank you, come again soon!"