defmodule Solution do

  @moduledoc """
        Task URL: https://leetcode.com/problems/two-sum/
        
        Method 1: Naive implementation, attempting every possible pair, O(n^2/2) = O(n^2)

        Submission URL: https://leetcode.com/submissions/detail/850595128/
  """

  @spec two_sum(nums :: [integer], target :: integer) :: [integer]
  

  def two_sum(nums = [num | rest_nums], target), do: do_two_sums(target, num, 0, rest_nums)

  #
                                                    
  defp do_two_sums(_target, _num, _index_of_num, []), do: [nil, nil]
                              
  defp do_two_sums(target, num, index_of_num, rest_nums = [head_of_rest | tail_of_rest]) do
    case number_from_list_that_when_added_to_num_sums_to_target(target, num, index_of_num, rest_nums, index_of_num+1) do
        {nil, nil} -> do_two_sums(target, head_of_rest, index_of_num+1, tail_of_rest)
        {another_index, another_number} -> [index_of_num, another_index]
    end
  end
      
  #

  defp number_from_list_that_when_added_to_num_sums_to_target(_target, _num, _index_of_num, [], _next_index), do: {nil, nil}

  defp number_from_list_that_when_added_to_num_sums_to_target(target, num, index_of_num, [head | tail], next_index) do
    case num + head == target do
      true -> {next_index, head}
      false -> number_from_list_that_when_added_to_num_sums_to_target(target, num, index_of_num, tail, next_index+1)
    end
  end
                                                                                 

end

