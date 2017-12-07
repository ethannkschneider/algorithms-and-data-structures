# Merge sort in Ruby

def merge_sort(arr, &prc)
  prc ||= Proc.new { |x, y| x <=> y }
  # base case
  return arr if arr.length <= 1

  # recursive step
  # split at the mid point, sort each half, and then merge them together
  mid = arr.length / 2
  sorted_left = merge_sort(arr.take(mid), &prc)
  sorted_right = merge_sort(arr.drop(mid), &prc)

  merge(sorted_left, sorted_right, &prc)
end

#auxilliary merge function
def merge(left, right, &prc)
  result = []
  until left.empty? || right.empty?
    case prc.call(left.first, right.first)
    when -1
      result << left.shift
    when 0, 1
      result << right.shift
    end
  end

  result.concat(left).concat(right)
end


# Tests:
arr1 = [5, 2, 7, 2, 34, 0, -3, -5, 2]
arr2 = [10, 9, 8, 7, 6, 6, 72, 3, 4]
arr3 = [-1, 2, -2, 3, -3, 4, -4, 0, 100 ,101, 2, -5, 17]
p merge_sort(arr1)
p merge_sort(arr2)
p merge_sort(arr3) { |x, y| y <=> x }
