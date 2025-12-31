# Try it at: https://www.hackerrank.com/challenges/eval-ex/problem

defmodule Solution do

  def exp(x, terms \\ 10) do
    exp_(x, terms, 1, 1, 0)
  end

  defp exp_(_, 0, _, _, _), do: 0
  defp exp_(x, terms, numer, denom, n) do
    numer/denom + exp_(x, terms-1, numer*x, denom*(n+1), n+1)
  end  

  def main() do
    _ = IO.read(:stdio, :line)
      |> String.trim
      |> String.to_integer
      
    IO.stream(:stdio, :line)
      |> Enum.map(&String.trim/1)
      |> Enum.map(&Float.parse/1)
      |> Enum.map(&(elem(&1,0)))
      |> Enum.map(&exp/1)
      |> Enum.each(&IO.puts/1)
  end

end

Solution.main
