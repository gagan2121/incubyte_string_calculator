class StringCalculator
  def add(str)
    return 0 if str.empty?

    separators = get_separators(str)
    str = get_numbers(separators, str)
    
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
end