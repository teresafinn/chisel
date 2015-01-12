require 'minitest/autorun'
require_relative '../lib/chisel3'

class ChiselTest < Minitest::Test 

  def setup
    @chisel = Chisel.new
    @document = '# My Life in Desserts

## Chapter 1: The Beginning

"You just *have* to try the cheesecake," he said. "Ever since it appeared in
**Food & Wine** this place has been packed every night."'
  end

  def test_chisel_class_exists
    assert @chisel
  end

  def test_it_converts_simple_string
    skip
    document = "# My Life in Desserts"
    assert_equal "<h1>My Life in Desserts</h1>", @chisel.parse(document)
  end

  def test_it_converts_a_md_string_to_array
    assert_equal 3, @chisel.separate_string(@document).count 
  end

  def test_it_separates_correctly
    assert_equal "# My Life in Desserts", @chisel.separate_string(@document).first

    assert_equal '"You just *have* to try the cheesecake," he said. "Ever since it appeared in
**Food & Wine** this place has been packed every night."', @chisel.separate_string(@document).last
  end

  def test_it_correctly_classifies_h1
    separated = @chisel.separate_string(@document)
    assert_equal "<h1>My Life in Desserts</h1>", @chisel.classify(separated.first)
  end

  def test_it_correctly_classifies_h2
    separated = @chisel.separate_string(@document)
    assert_equal "<h2>Chapter 1: The Beginning</h2>", @chisel.classify(separated[1])
  end

  def test_it_correctly_classifies_unord_list
    input = "* Sushi\n* Barbeque"
    assert_equal "<ul><li>Sushi</li><li>Barbeque</li></ul>", @chisel.classify(input)
  end

  def test_it_correctly_classifies_ord_list
    input = "1. Sushi\n2. Barbeque"
    assert_equal "<ol><li>Sushi</li><li>Barbeque</li></ol>", @chisel.classify(input)
  end  

  def test_it_converts_fancy_paragraphs
    input = "My *emphasized and **stronged** text* is awesome."
    assert_equal "<p>My <em>emphasized and <strong>stronged</strong> text</em> is awesome.</p>", @chisel.classify(input)
  end

  def test_it_converts_md_array_to_html_array
    input = ["# Hello", "## This is great"]
    assert_equal ["<h1>Hello</h1>","<h2>This is great</h2>"], @chisel.convert_to_html(input)
  end

  def test_it_parses_markdown
    assert @chisel.parse(@document).include?("<h1>My Life in Desserts")
    assert @chisel.parse(@document).include?("Wine</strong> this place has been packed every night.")
  end

end

