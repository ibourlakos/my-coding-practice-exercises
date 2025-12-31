defmodule Solution do

  @moduledoc """
    Task URL: https://leetcode.com/problems/ugly-number/
    
    Submission URL: https://leetcode.com/submissions/detail/845819960/
  """

  @spec is_ugly(n :: integer) :: boolean

  def is_ugly(n) when n < 0, do: false
  def is_ugly(0), do: false
  def is_ugly(1), do: true
  def is_ugly(2), do: true
  def is_ugly(3), do: true
  def is_ugly(5), do: true
  def is_ugly(n) when rem(n, 2) == 0, do: is_ugly(div(n,2))                    
  def is_ugly(n) when rem(n, 3) == 0, do: is_ugly(div(n,3))                    
  def is_ugly(n) when rem(n, 5) == 0, do: is_ugly(div(n,5))                    
  def is_ugly(_n), do: false

end
