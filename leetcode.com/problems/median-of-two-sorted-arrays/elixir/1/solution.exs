# https://leetcode.com/problems/median-of-two-sorted-arrays/

# Method 1: Median after merge; using List.delete_at/2

defmodule Solution do

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
                                                 
    defp _median(nums) do
        nums
        |> _chip_left()
        |> _chip_right()
        |> _median()
    end
        
    #
    
    @spec _chip_left(arr :: [any]) :: [any]
    
    defp _chip_left(arr), do: List.delete_at(arr, 0)
    
    #
    
    @spec _chip_right(arr :: [any]) :: [any]
        
    defp _chip_right(arr), do: List.delete_at(arr, -1)
    
    #
        
end