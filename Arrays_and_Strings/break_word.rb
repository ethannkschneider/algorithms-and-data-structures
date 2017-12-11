require 'set'
require 'byebug'

# I got this problem in an interview; here is my attempt to write Ruby version:

# Given an input string and a dictionary of words,
# segment the input string into a space-separated
# sequence of dictionary words if possible. For
# example, if the input string is "applepie" and
# dictionary contains a standard set of English words,
# then we would return the string "apple pie" as output.

# For testing:
$dict = Set.new ["a", "cat", "is", "asleep", "sleep", "i", "over", "there", "the", "as"]

def break_words(str)
  return str if $dict.include?(str)
  length = str.length
  i = 0
  while i < length
    prefix = str[0..i]
    if $dict.include?(prefix)
      suffix = str[i + 1..length - 1]
      broken_suffix = break_words(suffix)
      if broken_suffix
        return prefix + " " + broken_suffix
      end
    end
    i += 1
  end
  nil
end

# This method works, but it isn't very efficient
# The time complexity should be O(2^n), since in the worst-case scenario
# we have to check every possible substr of the input str, and the set of all
# possible substrings has size 2^n (it's a power set).
# See here: http://thenoisychannel.com/2011/08/08/retiring-a-great-interview-problem

# This following utilizes memoization to improve time complexity.
# We pass through a memo hash that maps from substrings to a valid segmented version of them.
#
def break_words_memo(str, memo = {})
  return str if $dict.include?(str)
  return memo[str] if memo[str]
  length = str.length
  i = 0
  while i < length
    prefix = str[0..i]
    if $dict.include?(prefix)
      suffix = str[i + 1..length - 1]
      broken_suffix = break_words_memo(suffix, memo)
      if broken_suffix
        memo[str] = prefix + " " + broken_suffix
        return prefix + " " + broken_suffix
      end
    end
    i += 1
  end
  memo[str] = nil
  nil
end




# For testing:

p break_words("acatisasleepoverthere")
p break_words("acatisasleepovertherebbbbb")
p break_words("acat")
p break_words("asleepoverthere")
p break_words("catisasleep")

p break_words_memo("acatisasleepoverthere")
p break_words_memo("acatisasleepovertherebbbbb")
p break_words_memo("acat")
p break_words_memo("asleepoverthere")
p break_words_memo("catisasleep")
