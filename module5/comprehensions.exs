#Comprehensions

IO.puts("")
IO.puts("*Comprehensions")
IO.puts("^Syntactic sugar for Loop over an Enumerable, 
often filtering out some results and mapping values into another list")
IO.puts("--Example: ")
IO.inspect(for n <- [1,2,3,4], do: n*n)
IO.puts("generator: n <- [1,2,3,4]")
IO.puts("for n <- 1..4, do: n*n => #{inspect for n <- 1..3, do: n*n}")

IO.puts("--support pattern matching on their-left-hand")
values=[good: 1, good: 2, bad: 3, good: 4]
IO.puts "values: -> #{inspect values}"
IO.puts("for {:good, n} <- values, do: n*n => #{inspect for {:good, n} <- values, do: n*n}")
IO.puts "--select particular elements"
IO.puts "for n <- 0..5, rem(n,3)==0 do: n*n => #{inspect for n <- 0..5, rem(n,3) == 0, do: n*n}"
#Note: comprehensions allow multiple generators and filters to be given

#Bitstring generators
IO.puts ""
IO.puts "BitString generators"
IO.puts "bitstring generator can be mixed with \"regular\" enumerable enumerators"
pixels = <<213,45,132,64,76,32,76,32,76,0,0,234,32,15>>
IO.inspect for <<r::8, g::8, b::8 <- pixels>>, do: {r,g,b}

#The :into option
IO.puts ""
IO.puts "The :into option"
IO.puts "the result of a comprehension can be inserted into different
data structures by passing the :into option to the comprehension"
IO.inspect for << c <- "hello world" >>, c!=?\s, into: "", do: <<c>>
#Note: :into accepts any structure that implements the Collectable protocol
IO.puts "--transforming values in a map: "
IO.inspect for {key, val} <- %{"a" => 1, "b" => 2}, into: %{}, do: {key, val*val}
