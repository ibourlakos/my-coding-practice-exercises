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
  
  def print_list([head|tail]) do
    if (tail === []) do
      IO.puts(head)
    else
      IO.puts(head)
      print_list(tail)
    end
  end

  def s() do
    input_integer()
  end

  def x() do
    case input_integer() do
      nil -> []
      num -> [num] ++ x()
    end
  end
  
  def replicate_one(times, value) when is_integer(times) and times >= 1 do
    case times do
      1 -> [value]
      _ -> [value] ++ replicate_one(times - 1, value)
    end
  end
  
  def replicate_all(times, [head|tail]) when is_integer(times) and times >= 1 do
    case tail do
      [] -> replicate_one(times, head)
      _ -> replicate_one(times, head) ++ replicate_all(times, tail)
    end
  end
  
  def solve() do
    times = s()
    values = x()
    times |> replicate_all(values) |> print_list
  end
  
end

Solution.solve()
