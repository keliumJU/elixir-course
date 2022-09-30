#Recursion

#Recursion: Loops through recursion, A function is called recursively until a condition is reached that stops the recursive action from continuing.

IO.puts("Recursion")
#Works with clauses and guards similar to "case"
defmodule Recursion do
  #recusive function when n > 0
  def print_multiple_times(msg,n) when n>0 do
    IO.puts(msg)
    print_multiple_times(msg,n-1)
  end

  #close condition with clause in module, ignore msg because n===0
  def print_multiple_times(_msg, 0) do
    :ok
  end

end

Recursion.print_multiple_times("Hello!",3)

#Reduce and map algorithms
IO.puts("")
IO.puts("Reduce and map algorithms")
IO.puts("Reduce algorithm: ")
defmodule MathLocal do
  def sum_list([head|tail],accumulator) do
    sum_list(tail, head+accumulator)
  end

  def sum_list([], accumulator) do
    accumulator
  end
end
IO.puts(MathLocal.sum_list([1,2,3,4],0))
IO.puts("Map algorithm: ")

defmodule MathLocal2 do
  #Return a list that mod every head until is empty and return the new value(head*2)
  def double_each([head|tail]) do
    [head*2|double_each(tail)]
  end
  #This is the empty list that return the end iteration before to begin to return every head*2 
  def double_each([]) do
    []
  end
end
IO.inspect(MathLocal2.double_each([1,2,3,4]))

#The Enum module
#Reduce with Enum module
IO.puts("")
IO.puts("Reduce with Enum module")
reduce=Enum.reduce([1,2,3],0,fn(x,acc)->x+acc end)
IO.puts("[1,2,3], acc: #{reduce}")
map=Enum.map([1,2,3], fn(x)->x*2 end)
IO.puts("[1,2,3] double: #{inspect(map)}")
