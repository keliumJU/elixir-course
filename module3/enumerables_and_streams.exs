#Enumerables and Streams

IO.puts("Enumerables: ")
IO.inspect(Enum.map([1,2,3],fn x->x*2 end))
IO.inspect(Enum.map(%{1=>2,3=>4},fn {k,v}->k*v end))
IO.puts("Enum module: sort,group,filter,retrieve")
IO.puts("Ranges in elixir(1..3):")
IO.inspect(Enum.map(1..5,fn x->x*2 end))
IO.inspect(Enum.reduce(1..3, 0, &+/2))

#Eager vs Lazy
#Note: all functions in the Enum module are eager, expect and enumerable and return a list back
IO.puts("")
IO.puts("Eager(Enum)")
#Return a boolean and check if a integer is not even, with capture "&"
odd? =&(rem(&1,2)!=0)
IO.inspect(Enum.filter(1..10,odd?))
IO.puts("Enum generate an intermidiate list until we reacht the result")
IO.inspect(1..100_000 |> Enum.map(&(&1 * 3)) |> Enum.filter(odd?) |> Enum.sum())

#The pipe operator(|>)
#Note: takes the output from the expression on its left side and passes it as the first argument to the function call on its right side

#Streams(Alternative to Enum)
#
IO.puts("")
IO.puts("Streams(Lazy)")
IO.puts("Streams build a series of computations that are invoked only when we pass \n the underlying stream to the Enum module")
#Note: Streams are useful when working with large, possibly infite, collections
IO.inspect(1..100_000 |> Stream.map(&(&1*3)) |> Stream.filter(odd?) |> Enum.sum())
#Note: Many functions in the Stream module accept any enumerable as an argument and return a stream as a result.
stream = Stream.cycle([1,2,3])
IO.inspect(stream)
IO.inspect(Enum.take(stream,10))
IO.puts("Generate values from a given initial value: ")
stream = Stream.unfold("hello", &String.next_codepoint/1)
IO.inspect(stream)
IO.inspect(Enum.take(stream,3))

#Stream.resource/3 example
#Note: Guaranteeing they are opened right before enumeratoin and closed afterwards, even in the case of failures.
stream = File.stream!("actividades.txt")
IO.puts("Stream.resource")
IO.inspect(stream)
IO.inspect(Enum.take(stream,10))
