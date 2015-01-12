class List

  def unord_list(input)
    "<ul>#{unord_list_items(input)}</ul>"
  end

  def unord_list_items(input)
    split_list = input.split("\n")
    no_bullet_list = split_list.map { |e| "<li>#{e[2..-1]}</li>" }
    no_bullet_list.join
  end

  def ord_list(input)
    "<ol>#{ord_list_items(input)}</ol>"
  end

  def ord_list_items(input)
    split_list = input.split("\n")
    no_numbers_list = split_list.map { |e| "<li>#{e[3..-1]}</li>"}
    no_numbers_list.join
  end

end
