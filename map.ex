defmodule Maps do
  def iterative_map(list, func) do
    new_list = []
    Enum.each(list, fn(item) -> new_list <> func.(item) end)
    new_list
  end

  def recursive_map(list, func) do
    case list do
      [item] -> [func.(item)]
      [item | rest] -> [func.(item), recursive_map(rest, func)]
    end
  end
  def recursive_map(_list, []), do: nil
end

Maps.iterative_map([1,2,3,4,5], fn(i) -> i * 2 end)
