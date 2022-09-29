#Pattern Matching

#Interactive mode iex, but instead i will write everything that the interactive mode shows with an IO.puts

#The match Operator
IO.puts("The match operator")
x=1
IO.puts(x)
IO.puts("1=x -> #{1=x}")
IO.puts("2=x -> no match right hand side value: 1")

#Pattern matching 
{a, b, c} = {:hello, "world", 42}
IO.puts("Pattern Matching")
IO.puts("only works with have the same size, and the comparing is with the same types")
IO.puts("Pattern Matching with tuples")
IO.puts("{a,b,c} = {:hello, \"world\", 42} -> \n a: #{a} \n b: #{b} \n c: #{c}")
IO.puts("mathc with specific values: ")
{:ok, result} = {:ok, 13}
IO.puts("{:ok, result} = {:ok, 13} -> \n result: #{result}")

#Patter matching 
IO.puts("")
IO.puts("Pattern Matching on List")
[a,b,c] = [1,2,3]
IO.puts("[a,b,c] = [1,2,3] -> \n a: #{a} \n b: #{b} \n c: #{c}")
IO.puts("Head and tail")
[head|tail] = [1,2,3]
IO.puts("[head | tail] = [1,2,3] -> \n head: #{head} \n tail: #{inspect(tail)}")
IO.puts("Prepending items to list: ")
list = [1,2,3]
IO.puts("list: #{inspect(list)}")
IO.puts("[0 | list] -> #{inspect([0|list])} ")

#The pin operator
IO.puts("")
IO.puts("The pin operator")
IO.puts("pattern match against a variable's existing value, rather than rebinding the variable")
x=1
IO.puts("x = 1 -> 1")
IO.puts("^x = 2 -> no match of right hand side(compare not asing)")

#Ignore particular value in pattern
IO.puts("")
IO.puts("Ignore particular value in match pattern")
result=[head|_]=[1,2,3]
IO.puts("[head | _] = [1,2,3] -> #{inspect(result)}")
IO.puts("head -> #{head}")
IO.puts("the variable _ -> generate error if you can see")
