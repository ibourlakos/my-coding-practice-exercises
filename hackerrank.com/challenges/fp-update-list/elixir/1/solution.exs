# Try it at: https://www.hackerrank.com/challenges/fp-update-list/problem

defmodule Solution do

  def main do
    IO.stream(:stdio, :line) |>
    Enum.map(&String.trim/1) |>
    Enum.map(&String.to_integer/1) |>
    Enum.map(&abs/1) |>
    Enum.map(&("#{&1}\n")) |>
    IO.puts
  end
  
end

Solution.main
