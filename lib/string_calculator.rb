class StringCalculator
  def add(str)
    return 0 if str.empty?

    str.split(/,|\n/).map(&:to_i).sum
  end
end