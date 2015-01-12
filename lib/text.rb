class Text

  def p_tags(input)
    format("<p>#{input}</p>")
  end

  def h1_tags(input)
    format("<h1>#{input[2..-1]}</h1>")
  end

  def h2_tags(input)
    format("<h2>#{input[3..-1]}</h2>")
  end

  def h3_tags(input)
    format("<h3>#{input[4..-1]}</h3>")
  end

  def h4_tags(input)
    format("<h4>#{input[5..-1]}</h4>")
  end

  def h5_tags(input)
    format("<h5>#{input[6..-1]}</h5>")
  end

  def h6_tags(input)
    format("<h6>#{input[7..-1]}</h6>")
  end

  def strong_tags(input)
    first = input.sub('**', '<strong>')
    second = first.sub('**', '</strong>')
    second.include?('**') ? strong_tags(second) : second
  end

  def em_tags(input)
    first = input.sub('*', '<em>')
    second = first.sub('*', '</em>')
    second.include?('*') ? em_tags(second) : second
  end

  def format(input)
    input = strong_tags(input)
    em_tags(input)
  end

end