# Can run this file with the following:
#
#   iex> mix run map.ex --no-mix-exs
#

defmodule Maps do
  def iterative_map(list, func) do
    # Can't be done iteratively. I tried everything, but couldn't colect
    # the results from Enum.each/2 into a List to return.
    Enum.map(list, &(func.(&1)))
  end

  def recursive_map(list, func) do
    case list do
      [item] -> [func.(item)]
      [item | rest] ->
        List.flatten([func.(item), recursive_map(rest, func)])
    end
  end

  def reduced_map(list, func) do
    # NOTE: Could also be written like this:
    #
    #   Enum.reduce(list, [], &(&2 ++ [func.(&1)]))
    #
    # NOTE: Or like this:
    #
    #   list
    #   |> Enum.reduce([], fn i, acc -> [func.(i) | acc] end)
    #   |> Enum.reverse
    Enum.reduce(list, [], fn i, acc -> acc ++ [func.(i)] end)
  end
end

defmodule MapsCaller do
  def call do
    IO.puts("Iterative Map:")
    Maps.iterative_map([1,2,3,4,5], fn i -> i * 2 end) |> IO.inspect()
    IO.puts("Recursive Map:")
    Maps.recursive_map([1,2,3,4,5], fn i -> i * 2 end) |> IO.inspect()
    IO.puts("Reduced Map:")
    # NOTE: The &(&1 * 2) is shorthand for the anonymous function
    Maps.reduced_map([1,2,3,4,5], &(&1 * 2)) |> IO.inspect()
  end
end

MapsCaller.call()
