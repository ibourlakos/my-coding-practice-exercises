# Try it at: https://www.hackerrank.com/challenges/area-under-curves-and-volume-of-revolving-a-curv/problem

defmodule Solution do

  @subintervals_length 0.001
  
  def ints_from_line do
    IO.read(:line)
      |> String.split()
      |> Enum.map(&String.to_integer/1)
  end
  
  defp _reduce_polynomial([], reduced), do: reduced
  defp _reduce_polynomial( [{e,c}], reduced ), do: [ {e,c} | reduced ]
  defp _reduce_polynomial( [ {e,c1}, {e,c2} | rest ], reduced ) do
    _reduce_polynomial(rest, [{e,c1+c2}|reduced])
  end
  defp _reduce_polynomial( [ {e1,c1}, {e2,c2} | rest ], reduced ) do
    _reduce_polynomial( rest, [ {e1,c1}, {e2,c2} | reduced ] )
  end
  
  def to_polynomial(exponents, coefficients) do
    polynomial_list = 
      List.zip([exponents, coefficients])
      |> Enum.sort(&<=/2)
      |> _reduce_polynomial([])
      |> Enum.reverse
     fn(x) ->
        polynomial_list
          |> Enum.map(fn({exp, coeff}) -> :math.pow(x, exp) * coeff end)
          |> Enum.sum
     end
  end
  
  # TODO: add more functions here
  
  def main do

    coefficients = ints_from_line()
    exponents = ints_from_line()
    [left, right] = ints_from_line()
    
    polynomial = to_polynomial(exponents, coefficients)

    poly_sum = left..right//@subintervals_length
    |> Enum.map(&(polynomial.(&1)))
    |> Enum.sum
    
    IO.inspect(poly_sum)
    
    # TODO: finish main

  end
  
end

Solution.main
