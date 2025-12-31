defmodule Solution do

    @moduledoc """
        Task URL: https://leetcode.com/problems/contains-duplicate
        
        Submission URL: https://leetcode.com/submissions/detail/845203648/
        
        Method 1: Sort first then search for adjacent duplicates       
    """

  @spec contains_duplicate(nums :: [integer]) :: boolean

  def contains_duplicate(nums) do
    nums
    |> Enum.sort()
    |> _contains_duplicate_sorted()
  end

  #

  @spec _contains_duplicate_sorted(nums :: [integer]) :: boolean

  defp _contains_duplicate_sorted([]), do: false
  defp _contains_duplicate_sorted([x]), do: false
  defp _contains_duplicate_sorted([x,x|_rest]), do: true
  defp _contains_duplicate_sorted([_head|rest]), do: _contains_duplicate_sorted(rest)

end
