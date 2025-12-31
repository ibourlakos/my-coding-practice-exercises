defmodule Solution do

    @moduledoc """
        Task URL: https://leetcode.com/problems/contains-duplicate
        
        Method 2: Use a map
        
        Time submitted: 11/16/2022 10:38
        Runtime:        454 ms < 96.67% Elixir
        Memory:         69.5 MB < 76.67% Elixir
    """

  @spec contains_duplicate(nums :: [integer]) :: boolean

  def contains_duplicate(nums) do
    _contains_duplicate_in_map(nums, %{})
  end

  #

  @spec _contains_duplicate_in_map(nums :: [integer], map :: %{integer => boolean}) :: boolean

  defp _contains_duplicate_in_map([], _map), do: false

  defp _contains_duplicate_in_map([x|rest], map) do
    if Map.get(map, x), do: true, else: _contains_duplicate_in_map(rest, Map.put_new(map, x, true))
  end

                                      
end
