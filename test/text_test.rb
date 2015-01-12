require 'minitest/autorun'
require_relative '../lib/text'

class TextTest < Minitest::Test 

  def setup
    @text = Text.new
    @format = Text.new
  end

  def test_it_exists
    assert @text
  end

  def test_it_converts_to_p_tags
    input = "a"
    assert_equal "<p>a</p>", @text.p_tags(input)
  end

  def test_it_converts_one_letter_to_h1_tags
    input = "# a"
    assert_equal "<h1>a</h1>", @text.h1_tags(input)
  end
  
  def test_it_converts_three_letters_to_h1_tags
    input = "# abc"
    assert_equal "<h1>abc</h1>", @text.h1_tags(input)
  end

  def test_it_converts_phrases_to_h1_tags
    input = "# My Life in Desserts"
    assert_equal "<h1>My Life in Desserts</h1>", @text.h1_tags(input)
  end

  def test_it_converts_to_h2_tags
    input = "## My Life in Desserts"
    assert_equal "<h2>My Life in Desserts</h2>", @text.h2_tags(input)
  end

  def test_it_converts_to_h3_tags
    input = "### My Life in Desserts"
    assert_equal "<h3>My Life in Desserts</h3>", @text.h3_tags(input)
  end

  def test_it_converts_to_h4_tags
    input = "#### My Life in Desserts"
    assert_equal "<h4>My Life in Desserts</h4>", @text.h4_tags(input)
  end

  def test_it_converts_to_h5_tags
    input = "##### My Life in Desserts"
    assert_equal "<h5>My Life in Desserts</h5>", @text.h5_tags(input)
  end

  def test_it_converts_to_h6_tags
    input = "###### My Life in Desserts"
    assert_equal "<h6>My Life in Desserts</h6>", @text.h6_tags(input)
  end

  def test_it_converts_to_em_tags
    input = "*a*"
    assert_equal "<em>a</em>", @format.em_tags(input)
  end

  def test_it_converts_two_sets_of_em_tags
    input = "*a* and *b*"
    assert_equal "<em>a</em> and <em>b</em>", @format.em_tags(input)
  end

  def test_it_converts_to_strong_tags
    input = "**a**"
    assert_equal "<strong>a</strong>", @format.strong_tags(input)
  end

  def test_it_converts_two_sets_of_strong_tags
    input = "**a** and **b**"
    assert_equal "<strong>a</strong> and <strong>b</strong>", @format.strong_tags(input)
  end

  def test_it_converts_em_and_strong_tags
    input = "*a* and **b**"
    first = @format.strong_tags(input)
    assert_equal "<em>a</em> and <strong>b</strong>", @format.em_tags(first)
  end

  def test_it_converts_em_embedded_into_strong_tags
    input = "**My Life in *Desserts* **"
    first = @format.strong_tags(input)
    assert_equal "<strong>My Life in <em>Desserts</em> </strong>", @format.em_tags(first)
  end

end