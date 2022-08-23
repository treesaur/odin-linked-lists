require_relative './node.rb'

class LinkedLists
  attr_accessor :head

  def initialize
    @head = nil
  end

  def append(value)
    if @head.nil?
      @head = Node.new(value)
    else
      self.tail.next_node = Node.new(value)
    end
  end

  def prepend(value)
    new_second = @head # current head node becomes second in place
    @head = Node.new(value, new_second) # head node is reassigned as input value
  end

  def size
    return 0 if @head.nil?

    count = 1
    current_node = @head

    while current_node.next_node
      count += 1
      current_node = current_node.next_node
    end

    count
  end

  def tail
    tail_node = @head 
    return tail_node unless @head.next_node

    while tail_node.next_node
      tail_node = tail_node.next_node
    end

    tail_node
  end

  def at(index, get_node = false)
    count = 0
    current_node = @head
    until count == index
      current_node = current_node.next_node
      count += 1
    end

    return current_node if get_node
    current_node.value
  end

  def pop
    popped_node = self.tail
    current_node = @head
    idx = 0
    until idx == self.size - 2
      current_node = current_node.next_node
      idx += 1  
    end

    current_node.next_node = nil
    popped_node.value
  end

  def contains?(value)
    current_node = @head
    count = 0
    while current_node.next_node
      return true if current_node.value == value
      current_node = current_node.next_node
      count += 1
    end

    false
  end

  def find(value)
    current_node = @head

    (0...self.size).each do |idx|
      return idx if current_node.value == value
      current_node = current_node.next_node
    end

    nil
  end

  def to_s
    str = ""
    current_node = @head
    while current_node.next_node
      str += " ( #{current_node.value } ) -> "
      current_node = current_node.next_node
    end

    str += " ( #{tail.value} ) -> nil"
  end

  # ex cred

  def insert_at(value, index)
    return "Index non-existent" if index > self.size - 1
    before_insert_node = self.at(index - 1, true)
    after_insert_node = self.at(index, true)

    before_insert_node.next_node = Node.new(value, after_insert_node)
    true
  end

  def remove_at(index)
    return "Index non-existent" if index > self.size - 1
    
    if index == 0 # for removing head node
      new_head_node = self.at(1, true)
      @head = new_head_node
      return true
    else
      previous_remove_at_node = self.at(index - 1, true)
      if index == self.size - 1 # for removing tail node
        previous_remove_at_node.next_node = nil
        return true
      else
        next_remove_at_node = self.at(index + 1, true)
      end
    end

    previous_remove_at_node.next_node = next_remove_at_node
    true
  end
end