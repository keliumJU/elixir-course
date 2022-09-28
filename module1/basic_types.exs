#Basic types

#Interactive mode iex, but instead i will write everything that the interactive mode shows with an IO.puts

IO.puts("*Basic Arithmetic")
IO.puts(1+2)
IO.puts(5*5)
IO.puts(10/2)
IO.puts("mod rem/1")
mod=rem(10,2)
output="10%2 = #{mod}"
IO.puts(output)
IO.puts("exact division")
division=div(10,2)
output="10/2 = #{division}"
IO.puts(output)

IO.puts("")

IO.puts("* approximate values whit round and trunc")
value=round(3.8)
output="round(3.8) -> #{value}"
IO.puts(output)
value=trunc(3.8)
output="trunc(3.8) -> #{value}"
IO.puts(output)

#Identifiying functions and documentation with on interactive mode
#iex h trunc/1 -> here identify the number of args of function
IO.puts("")
IO.puts("* Identifiying functions documentation: ")
IO.puts("h trunc/1")

#Booleans
IO.puts("")
IO.puts("Booleans: ")
IO.puts(true)
IO.puts(false)
value=true==false
output="true == false -> #{value}"
IO.puts(output)

#Atoms
IO.puts("")
IO.puts("Atoms or constans")
:apple
:orange
:watermelon
output="this are atoms: #{:apple}, #{:orange}, #{:watermelon}."
IO.puts(output)
IO.puts("Also define how aliases start in upper case")
value=is_atom(Hello)
output="is_atom(Hello) -> #{value}"
IO.puts(output)

#Strings 
IO.puts("")
IO.puts("Strings")
IO.puts("hello")
string = :world
IO.puts("hello #{string}")
IO.puts("hello\nworld")
value=is_binary("hello")
IO.puts("is_binary(\"hello\") -> #{value}")
IO.puts("byte_size(\"hello\") -> #{byte_size("hello")}")
IO.puts("String.length(\"hello\") -> #{String.length("hello")}")
IO.puts("String.upcase(\"hello\") -> #{String.upcase("hello")}")

#Anonymous functions
IO.puts("")
IO.puts("Anonymous functions")
add = fn a,b -> a+b end
IO.puts("add.(1,2) -> #{add.(1,2)}")
IO.puts("is_function(add) -> #{is_function(add)}")
IO.puts("count the number of arguments")
IO.puts("is_function(add,2) -> #{is_function(add,2)}")
IO.puts("is_function(add,1) -> #{is_function(add,1)}")

#Linked List
IO.puts("")
IO.puts("Linked Lists")
list=[1,2,true,1]
IO.puts("list: #{inspect(list)}")
IO.puts("concatenated or subtracted ++/2 and --/2")
list=[1,2,3] ++ [4,5,6]
IO.puts("[1,2,3] ++ [4,5,6] -> #{inspect(list)}")
list=[1,true,2,false,3,true] -- [true,false]
IO.puts("[1,true,2,false,3,true] -- [true, false] #{inspect(list)}")
IO.puts("head and tail of linked list")
list=[1,2,3]
IO.puts("head of #{inspect(list)}: hd(list)->#{inspect(hd(list))}")
IO.puts("tail of #{inspect(list)}: tl(list)->#{inspect(tl(list))}")
IO.puts("display the binary representation of a string: ")
IO.puts("i \"hello\"")

#Tuples
IO.puts("")
IO.puts("Tuples: ")
tuple={:ok, "hello"}
IO.puts("tuple -> #{inspect(tuple)}")
IO.puts("get element by index: elem(tuple,1) -> #{elem(tuple,1)}")
IO.puts("get element by index: elem(tuple,0) -> #{elem(tuple,0)}")
tuple_mod=put_elem(tuple,1,"world")
IO.puts("put element in particular index: put_elem(tuple,1,\"world\") -> #{inspect(tuple_mod)}")













