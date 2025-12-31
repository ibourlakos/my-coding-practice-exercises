# Definition for a binary tree node.
#
# defmodule TreeNode do
#   @type t :: %__MODULE__{
#           val: integer,
#           left: TreeNode.t() | nil,
#           right: TreeNode.t() | nil
#         }
#   defstruct val: 0, left: nil, right: nil
# end

defmodule Solution do
                        
  @moduledoc """
    Task URL: https://leetcode.com/problems/count-complete-tree-nodes/
    
    Method 2: Naive method using accumulator. Tail-recursive. O(n) time.

    Time Submitted  11/16/2022 01:28
    Runtime 454 ms < 100%
    Memory 65.6 MB < 100%
  """

  @spec count_nodes(root :: TreeNode.t | nil) :: integer

  def count_nodes(root), do: _count_nodes_with_acc(root, 0)
                           
  #

  @spec _count_nodes_with_acc(root :: TreeNode.t | nil, acc :: integer) :: integer
                                                          
  defp _count_nodes_with_acc(nil, acc), do: acc

  defp _count_nodes_with_acc(%TreeNode{val: _, left: left_tree, right: right_tree}, acc) do
    left_count = _count_nodes_with_acc(left_tree, 0)
    _count_nodes_with_acc(right_tree, acc+left_count+1)
  end

end
