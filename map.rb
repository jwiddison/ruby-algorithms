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
