# Given two strings, write a method to decide if one is a permutation of the other (CTCI p. 90)

# Attempt 1
def check_permutation(str1, str2)
  # Return false if they aren't the same lengths
  return false if str1.length != str2.length
  # Sort them and check for equality
  # Ruby's native sort uses an optimized quicksort, which is usually O(nlog(n))
  first_sorted = str1.sort
  second_sorted = str1.sort
  return false if first_sorted != second_sorted

  true
end

# Attempt 2
def check_permutation2(str1, str2)
  return false if str1.length != str2.length
  str1_char_count = Hash.new(0)
  str1.each_char { |ch| str1_char_count[ch] += 1 }
  str2.each_char do |ch|
    str1_char_count[ch] -= 1
    return false if str1_char_count[ch] < 0
  end

  true
end
