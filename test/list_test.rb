require 'minitest/autorun'
require_relative '../lib/list'

class ListTest < Minitest::Test 

  def setup
    @list = List.new
  end

  def test_it_exists
    assert @list
  end

  def test_it_creates_unordered_list_w_no_content
    input = "* "
    assert_equal \
      "<ul><li></li></ul>", @list.unord_list(input)
  end

  def test_it_creates_unordered_list_w_one_item
    input = "* Sushi"
    assert_equal "<ul><li>Sushi</li></ul>", @list.unord_list(input)
  end

  def test_it_creates_unordered_list_w_two_items
    input = "* Sushi\n* Barbeque"
    assert_equal "<ul><li>Sushi</li><li>Barbeque</li></ul>", @list.unord_list(input)
  end

  def test_it_creates_unordered_list_w_four_items
    input = "* Sushi\n* Barbeque\n* Mexican\n* Thai"
    assert_equal "<ul><li>Sushi</li><li>Barbeque</li><li>Mexican</li><li>Thai</li></ul>", @list.unord_list(input)
  end

  def test_it_creates_ordered_list_w_no_content
    input = "1. "
    assert_equal "<ol><li></li></ol>", @list.ord_list(input)

  end

  def test_it_creates_ordered_list_w_one_item
    input = "1. Sushi"
    assert_equal "<ol><li>Sushi</li></ol>", @list.ord_list(input)
  end

  def test_it_creates_ordered_list_w_two_items
    input = "1. Sushi\n2. Barbeque"
    assert_equal "<ol><li>Sushi</li><li>Barbeque</li></ol>", @list.ord_list(input)
  end

end