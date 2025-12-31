defmodule Solution do

  def input_line() do
    case IO.gets("") do
      :eof          -> nil
      { :error, _ } -> nil
      data          -> data |> String.trim_trailing("\n")
    end
  end
  
  def input_integer() do
    case input_line() do
      nil   -> nil
      data  -> data |> String.to_integer(10)
    end
  end
  
  def solve() do
    a = input_integer()
    b = input_integer()
    IO.puts(a + b)
  end
  
end

Solution.solve()
