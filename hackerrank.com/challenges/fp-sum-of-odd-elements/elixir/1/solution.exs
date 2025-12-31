defmodule Solution do

  def main do
    IO.stream(:stdio, :line) |>
    Enum.map(&String.trim/1) |>
    Enum.map(&String.to_integer/1) |>
    Enum.filter(&(abs(rem(&1,2)) == 1)) |>
    Enum.reduce(&(&1+&2)) |>
    IO.puts
  end
  
end

Solution.main
