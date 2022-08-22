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
      tail.next_node = Node.new(value)
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

  # def at(index)

  # end

  # def pop

  # end

  # def contains?(value)

  # end

  # def find(value)

  # end

  def to_s
    str = ""
    current_node = @head
    while current_node.next_node
      str += " ( #{current_node.value } ) -> "
      current_node = current_node.next_node
    end

    str += " ( #{tail.value} ) -> nil"
  end
end