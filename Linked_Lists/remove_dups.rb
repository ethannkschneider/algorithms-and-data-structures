# Write code to remove duplicated from an unsorted linked list (CTCI p. 94)

# Attempt 1
# I'm assuming the input points to the head node
def remove_dups(head_node)
  # return nil if we are passed nil; return just the head if it's the only node
  return head_node if head_node.nil? || head_node.next.nil?

  # store all visited nodes in this 'seen' hash
  # this allows us to identify dups as we go
  seen = Set.new
  seen.add(head_node)
  current_node = head_node.next
  until current_node.nil?
    remove_node(current_node) if seen.has?(current_node)
    seen.add(current_node)

    current_node = current_node.next
  end

  # return a reference to the head node
  head_node
end

# helper method to clean up the code
def remove_node(node)
  # set the previous node's 'next' pointer to the node after the current node
  # this will work even if the node is the last node in the list (node.prev.next = nil)
  node.prev.next = node.next

  # since we are assuming we have a doubly linked list, we also want to se the other direction
  # but we have to be careful to check if it's the last node -- we don't want to set the prev attribute of nil
  node.next.prev = node.prev unless node.next.nil?
end
