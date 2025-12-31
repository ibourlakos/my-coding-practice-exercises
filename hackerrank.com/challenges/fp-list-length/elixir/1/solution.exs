# Try it at: https://www.hackerrank.com/challenges/fp-list-length/problem

defmodule Solution do

  def list_count([]), do: 0
  
  def list_count([_head|tail]), do: 1 + list_count(tail)
  
  def main do
    IO.read(:stdio, :all) |>
    String.split("\n") |>
    list_count() |>
    IO.puts
  end

end

Solution.main
