require_relative './linked_lists.rb'
require_relative './node.rb'

test = LinkedLists.new
p test
test.append("test1")
p test
p test.to_s
test.append("test2")
p test
p test.to_s
test.append("test3")
p test.to_s
test.append("test4")
p test.to_s
p test.size
test.prepend("test5")
p test.to_s
p test.size
test.prepend("test6")
p test.to_s