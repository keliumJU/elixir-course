#protocols :) 

IO.puts("*protocols")
IO.puts("--Mechanism to achieve polymorphism in Elixir when you want behaviour \n to vary depending on the dat type.")
IO.puts("solving via pattern matching and guard clauses")

defmodule Utility do
  def type(value) when is_binary(value), do: "string"
  def type(value) when is_integer(value), do: "integer"
  ###...
end  
#Note: this code could be problematic, there would be no easy way to extend its functionality

IO.puts("--Here are the protocols")
IO.puts("dispatching on a protocol is available to any data type that has implemented the protocol")

defprotocol Utility do
  @spec type(t) :: String.t()
  def type(value)
end

defimpl Utility, for: BitString do
  def type(_value), do: "string"
end  

defimpl Utility, for: Integer do
  def type(_value), do: "integer"
end
#Note: This look similar to interfaces or abstract base clasess
IO.inspect(Utility.type("foo"))
IO.inspect(Utility.type(123))
#Note: dispatching will always be based on the data type of the first input

#Protocol usage example
IO.puts("")
IO.puts("Protocol usage example")

defprotocol Size do
  @doc "Calculates the size (and not the length :O) of a data structure"
  def size(data)
end

#We can now implement this protocol for the data structures that would
#have a compliant implementation.
defimpl Size, for: BitString do
  def size(string), do: byte_size(string)
end

defimpl Size, for: Map do
  def size(map), do: map_size(map)
end

defimpl Size, for: Tuple do
  def size(tuple), do: tuple_size(tuple)
end

#start using 
IO.inspect(Size.size("foo"))
IO.inspect(Size.size({:ok, "hello"}))
IO.inspect(Size.size(%{label: "some label"}))

#Protocols and structs
IO.puts("")
IO.puts("Protocols and structs")
IO.puts("Structs require their own protocol implementation")

#Example with struct MapSet
defimpl Size, for: MapSet do
  def size(set), do: MapSet.size(set)
end

#Example with struct User 
defmodule User do
  defstruct [:name, :age]
end

defimpl Size, for: User do
  def size(_user), do: 2
end
#Note: you could use structs to build more robust data types, like queues, 
#and implement all relevant protocols, such as Enumerable and possibly Size,
#for this data type.

#Implementing Any
IO.puts("")
IO.puts("Implementing 'Any'")
IO.puts("We can explicity derive the procol implementation for our types or
  \n automatically implement the protocol for all types.")

#Deriving
IO.puts("Deriving")
defimpl Size, for: Any do
  def size(_), do: 0
end
#Note: we would need to tell our struct to explicitly derive the Size protocol.
defmodule OtherUser do
  @derive[Size]
  defstruct [:name, :age]
end

#Fallback to 'Any'
IO.puts("")
IO.puts("Fallback to Any")
IO.puts("Explicitly tell the protocol to fallback to Any when an implementation cannot be found.")

defprotocol Size do
  @fallback_to_any true
  def size(data)
end
#Note: Possibly I opted for deliver for its explicit feature

#Built-in protocols
IO.puts("")
IO.puts("Buit-in protocols")
IO.puts("Review the Enumerable protcol")
IO.inspect(Enum.map([1,2,3], fn x -> x*2 end))
IO.inspect(Enum.reduce(1..10, 0, fn x, acc -> x + acc end))
IO.puts("The String.Chars protocol, how convert a data structure as a string")
IO.puts("to_string :hello -> #{inspect to_string :hello}")
IO.puts("when there is a need to \"print\" a more complex data structure, one can use the inspect funciton, based on the Inspect protocol")
tuple={1,2,3}
IO.puts("tuple: \#\{inspect tupble} -> #{inspect tuple}")
