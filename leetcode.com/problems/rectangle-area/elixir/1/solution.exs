defmodule Solution do

  @moduledoc """
    Task URL: https://leetcode.com/problems/rectangle-area

    Submission URL: https://leetcode.com/submissions/detail/845198247/

    Method:
      Let given rectangles A and B.
      Calculate their enclosing rectangle C.
      Calculate their common rectangle area.
      Calculate the total area by adding A and B and excluding the common one.
  """

  @spec compute_area(ax1 :: integer, ay1 :: integer, ax2 :: integer, ay2 :: integer, bx1 :: integer, by1 :: integer, bx2 :: integer, by2 :: integer) :: integer

  def compute_area(ax1, ay1, ax2, ay2, bx1, by1, bx2, by2) do
    # the enclosing rectangle is C

    # bottom left of C
    cx1 = Enum.min([ax1, ax2, bx1, bx2])
    cy1 = Enum.min([ay1, ay2, by1, by2])

    # top right of C
    cx2 = Enum.max([ax1, ax2, bx1, bx2])
    cy2 = Enum.max([ay1, ay2, by1, by2])

    # calculate area using side lengths of A, B, C
    compute_area_using_sides(
        abs(ax1 - ax2),
        abs(ay1 - ay2),
        abs(bx1 - bx2),
        abs(by1 - by2),
        abs(cx1 - cx2),
        abs(cy1 - cy2)
    )
  end
      
  defp compute_area_using_sides(a_width, a_height, b_width, b_height, c_width, c_height) do
      common_width = a_width - c_width + b_width
      common_height = a_height - c_height + b_height
      
      a_area = a_width * a_height
      b_area = b_width * b_height
      
      common_area = if(common_width > 0 and common_height > 0) do
        common_width*common_height
      else
        0
      end
                                                                  
      a_area + b_area - common_area
      
  end
      
end
    
