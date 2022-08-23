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
puts test.at(1)
p test.pop
p test.to_s
p test.pop
p test.to_s
p test.contains?("test5")
p test.contains?("test4")
p test.find("test5")
p test.find("hello")
p test.insert_at("test0", 1)
p test.to_s
p test.insert_at("test25", 6)
p test.remove_at(1)
p test.to_s
p test.remove_at(0)
p test.to_s
p test.remove_at(2)
p test.to_s