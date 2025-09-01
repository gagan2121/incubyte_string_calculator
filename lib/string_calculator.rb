class StringCalculator
  def add(str)
    return 0 if str.empty?

    separators = get_separators(str)
    str = get_numbers(separators, str)

    negative_numbers = negative_numbers?(str)
    raise negative_error(negative_numbers) unless negative_numbers.empty?
    
    str.reduce(:+)
  end


  def get_numbers(separators, string)
    string.split(/#{Regexp.union(separators)}/).map(&:to_i)
  end

  def get_separators(string)
    separators = [',', "\n"]
    return separators unless includes_delimitier?(string)

    separators << string.split("\n")[0][2..-1]
  end

  def includes_delimitier?(string)
    string.start_with?('//')
  end

  def negative_numbers?(str)
      str.select{ |n| n if n.negative? }
  end
    
  def negative_error(numbers)
    "negative numbers not allowed #{numbers.join(',')}"
  end
end