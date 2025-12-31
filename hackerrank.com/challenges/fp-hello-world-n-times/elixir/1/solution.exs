defmodule Solution do
 
    def n() do
        IO.gets("") |> String.to_integer(10)
    end
    
    def hello(0) do
    # do nothing
    end

    def hello(n) when 0 < n and n <= 50 do
        IO.puts("Hello World")
        hello(n-1)
    end
    
    def run() do
        hello(n())
    end
    
end

Solution.run()
