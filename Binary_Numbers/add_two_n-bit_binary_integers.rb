# Consider the problem of adding two n-bit binary integers, stored in two n-element
# arrays A and B. The sum of the two integers should be stored in binary form in an
# (n+1)-element array C. Write the code. (Introduction to Algorithms, pp. 22-23)
def add_two_binary_ints(a, b, n)
  # declare a constant to store any carried 1's and an array C to store result
  carried = 0
  c = Array.new(n + 1)
  current_bit = (n - 1)
  current_sum = 0

  # using a decreasing while loop, we iterate through the arrays and add as we go
  while current_bit >= 0
    current_sum = a[current_bit] + b[current_bit] + carried
    c[current_bit + 1] = current_sum % 2 # mod by 2 to ensure we have a max value of 1 for each position
    carried = current_sum - 1 # carried is assigned to what is left over
    current_bit -= 1
  end
  # since our results array c is size n+1, we will need to add carried to the 0th index ourselves
  c[0] = carried
  c
end

# tests:
arr1 = [1, 0, 0, 1, 0, 1]
arr2 = [0, 1, 0, 1, 0, 1]
x = 6
p (add_two_binary_ints(arr1, arr2, x) === [0, 1, 1, 1, 0, 1, 0])

arr3 = [1, 1]
arr4 = [0, 1]
y = 2
p (add_two_binary_ints(arr3, arr4, y) == [1, 0, 0])

arr5 = [1, 0, 1, 0]
arr6 = [0, 0, 1, 1]
z = 4
p (add_two_binary_ints(arr5, arr6, z) == [0, 1, 1, 0, 1])
