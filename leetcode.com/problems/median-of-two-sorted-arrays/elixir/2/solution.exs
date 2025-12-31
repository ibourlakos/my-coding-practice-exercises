defmodule Solution do

    @moduledoc """
        Task URL: https://leetcode.com/problems/median-of-two-sorted-arrays/
        
        Method #2: Finding middle elements; without using List.*, Enum.*
        
        Results:
            Date:       2022-11-13 12:42
            Runtime:    587 ms, < 90.91%
            Memory:     51.8 MB, < 18.18%
    """

    #

    @spec find_median_sorted_arrays(nums1 :: [integer], nums2 :: [integer]) :: float
    
    def find_median_sorted_arrays(nums1, nums2) do
        _median(_merge_sorted(nums1, nums2))
    end
        
    #

    @spec _merge_sorted(nums1 :: [integer], nums2 :: [integer]) :: [integer]
        
    defp _merge_sorted(arr, []), do: arr
    defp _merge_sorted([], arr), do: arr
                                  
    defp _merge_sorted([v1|rest1], [v2|rest2]) when v1 <= v2, do: [v1|_merge_sorted(rest1,[v2|rest2])]      
    defp _merge_sorted([v1|rest1], [v2|rest2]) when v1 > v2, do: [v2|_merge_sorted([v1|rest1],rest2)]
                                                   
    #

    @spec _median(nums :: [integer]) :: float

    defp _median([]), do: 0
    defp _median([x]), do: x
    defp _median([x,y]), do: (x+y)/2
                                                 
    defp _median(nums), do: _median(_middle_elements(nums))

    #
    
    @spec _middle_elements(arr :: [integer]) :: [integer]
        
    defp _middle_elements(nums) do
        arr_length = _length(nums)
        case rem(arr_length, 2) do
            0 -> 
                {_, suffix} = _take(nums, div(arr_length, 2) - 1, [])
                {mid_elems, _ } = _take(suffix, 2, [])
                mid_elems
            1 ->
                {prefix, suffix} = _take(nums, div(arr_length, 2), [])
                {mid_elem, _ } = _take(suffix, 1, [])
                mid_elem
        end
    end
    
    #
        
    @spec _take(arr :: [integer], amount :: pos_integer, acc :: [integer]) :: [integer]
        
    defp _take([], _, acc), do: {acc, []}
    defp _take(rest, 0, acc), do: {acc, rest}
                  
    defp _take([x|rest], amount, acc) do
        _take(rest, amount - 1, [x|acc])
    end
                                                   
    #   
    
    @spec _length(arr :: [integer]) :: non_neg_integer
        
    defp _length([]), do: 0
    defp _length([_|rest]), do: 1 + _length(rest)

    #
        
end
