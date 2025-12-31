defmodule Solution do
  
  def list_reverse(list) do
    list |>
    Enum.map(&([&1])) |>
    Enum.reduce(&(&1++&2))
  end
  
  def main do
    IO.stream(:stdio, :line) |>
    Enum.map(&String.trim/1) |>
    list_reverse |>
    Enum.each(&IO.puts/1)
  end
end

Solution.main
