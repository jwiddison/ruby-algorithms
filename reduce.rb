# REDUCE

def reduce_iterative(list, acc)
  list.each { |item| acc = yield(acc, item) }
  acc
end
puts "\nReduce (Iterative):"
puts reduce_iterative([1,2,3,4,5], 0) { |acc, item| acc + item }
puts reduce_iterative(['How', ' are', ' you?'], '') { |acc, item| acc << item }

def reduce_recursive(list, acc)
  return yield(acc, list.first) if list.size == 1
  acc = yield(acc, list.shift)
  reduce_recursive(list, acc) { |acc, item| yield(acc, item) }
end
puts "\nReduce (Recursive):"
puts reduce_recursive([1,2,3,4,5], 0) { |acc, item| acc + item }.inspect
puts reduce_recursive(['How', ' are', ' you?'], '') { |acc, item| acc << item }
