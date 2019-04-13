# MAP

def iterative_map(list)
  new_list = []
  list.each { |item| new_list << yield(item) }
  new_list
end
puts "Map (Iterative):"
puts iterative_map([1,2,3,4,5]) { |i| i * 2 }.inspect

def recursive_map(list)
  return yield(list.first) if list.size == 1
  [ yield(list.shift), recursive_map(list) { |i| yield(i) } ].flatten
end
puts "\nMap (Recursive):"
puts recursive_map([1,2,3,4,5]) { |i| i * 2 }.inspect

def map_implemented_with_reduce(list)
  list.reduce([]) { |acc, item| acc << yield(item) }
end
puts "\nMap (With Reduce):"
puts map_implemented_with_reduce([1,2,3,4,5]) { |i| i * 2 }.inspect

# REDUCE

def reduce_iterative(list, acc)
  list.each { |item| acc = yield(acc, item) }
  acc
end
puts "\nReduce (Iterative):"
puts reduce_iterative([1,2,3,4,5], 0) { |acc, item| acc + item }
puts reduce_iterative(['How', ' are', ' you?'], '') { |acc, item| acc << item }

# TODO: Get this working
def reduce_recursive(list, acc)
  return if list.empty?
  item = list.shift
  puts "acc: #{acc}, item: #{item}, list: #{list}"
  acc = reduce_recursive(list, acc) { |acc, item| yield(acc, item)}
  acc
end
puts "\nReduce (Recursive):"
puts reduce_recursive([1,2,3,4,5], 0) { |acc, item| acc + item }.inspect
