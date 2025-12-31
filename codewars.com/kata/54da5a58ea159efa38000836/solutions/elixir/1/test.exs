defmodule TestSolution do
  use ExUnit.Case

  test "basic cases" do
    assert FindOdd.find([20,1,-1,2,-2,3,3,5,5,1,2,4,20,4,-1,-2,5]) == 5
    assert FindOdd.find([1,1,2,-2,5,2,4,4,-1,-2,5]) == -1
    assert FindOdd.find([20,1,1,2,2,3,3,5,5,4,20,4,5]) == 5
    assert FindOdd.find([10]) == 10
    assert FindOdd.find([1,1,1,1,1,1,10,1,1,1,1]) == 10
    assert FindOdd.find([5,4,3,2,1,5,4,3,2,10,10]) == 1
  end
end
