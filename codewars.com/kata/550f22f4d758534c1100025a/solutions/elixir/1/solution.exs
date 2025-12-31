defmodule Directions do

  # In order to simplify the path I trace the steps in a stack.
  #
  # This enables the reducer to detect and simplify both direct and
  # indirect cases (nested cases).
  #
  # The implementation resembles parenthesis pairing check algorithms.
  #

  def reduce(directions) do
    directions
    |> trace_directions([])
    |> Enum.reverse()
  end

  # If I am done with the given path, report the stack
  defp trace_directions([], trace_stack), do: trace_stack

  # If I am at a simplifiable point, remove the unnecessary directions
  # from both the remaining path and the trace stack
  defp trace_directions(["NORTH"|rest], ["SOUTH"|rest_stack]) do
    trace_directions(rest, rest_stack)
  end

  defp trace_directions(["SOUTH"|rest], ["NORTH"|rest_stack]) do
    trace_directions(rest, rest_stack)
  end

  defp trace_directions(["EAST"|rest], ["WEST"|rest_stack]) do
    trace_directions(rest, rest_stack)
  end

  defp trace_directions(["WEST"|rest], ["EAST"|rest_stack]) do
    trace_directions(rest, rest_stack)
  end

  # When given a non-simplifiable case, just push it in the trace stack
  defp trace_directions([new_dir|rest], trace_stack) do
      trace_directions(rest, [new_dir|trace_stack])
  end
end
