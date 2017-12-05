# Implement an algorithm to determine if a string has all unique characters. (CTCI p. 90)

# Attempt 1 
def is_unique(str)
  # Assuming the string is an extended ASCII string, we can't exceed this length
  return false if str.length > 256
  # store all 'seen' characters in a hash
  seen = {}
  str.each_char do |ch|
    # return false if we have already seen this character
    return false if seen[ch]
    # mark character as seen
    seen[ch] = true
  end
  # return true otherwise
  true
end

# Time Complextiy: O(1); we have to iterate through str (O(n)) and the each check of 'seen' is O(1) since hashes have constant lookup time complexity
# However, n cannot exceed 256, so in a sense it is constant time complexity.
# Space Complexity: O(1); we are making a new hash of size no more than 256 (worst case).
