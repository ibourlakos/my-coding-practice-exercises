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
    
    Method 1: Naive method. O(n) time.
  """

  @spec count_nodes(root :: TreeNode.t | nil) :: integer

  def count_nodes(nil), do: 0

  def count_nodes(%TreeNode{val: _, left: left_tree, right: right_tree}) do
    1 + count_nodes(left_tree) + count_nodes(right_tree)
  end

end
