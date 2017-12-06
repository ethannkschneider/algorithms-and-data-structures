# Implement an algorithm to find the kth to last element of a singly linked list (CTCI p. 94)

# Attempt 1
def return_kth_to_last(head_node, k)
  # I'm assuming we only want values of k s.t. k = 1, 2, 3, ...
  return nil if k < 1
  # create two pointer and move one of them k nodes from the head
  pointer_one = head_node
  pointer_two = head_node
  k.times do
    # if k ends up being greater than the length, we'll return nil
    return nil if pointer_one.nil?
    pointer_one = pointer_one.next
  end

  # now move each pointer through the list at the same speed
  # once pointer_one reaches the end, pointer_two will be at the node at (length - k)
  until pointer_one.nil?
    pointer_one, pointer_two = pointer_one.next, pointer_two.next
  end

  pointer_two

end
