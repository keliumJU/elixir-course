#Modules and functions

IO.puts("Modules and functions")
IO.puts("several functions into modules: ")
IO.puts("String.length(\"hello\") -> #{String.length("hello")}")

#Modules: first letter of the module must be in uppercase. -> macro:defmodule
#functions: first letter of every function must be in lowercase -> macro: def

#Scripted mode
defmodule MathLocal do
  def sum(a,b) do
    a+b
  end
end
IO.puts("#{MathLocal.sum(1,2)}")

#This module was defined in an external module (math.ex and compile with elixirc math.ex)
IO.puts(Math.sum(3,2))

#Private functions in module can only be invoked locally(same module) -> macro: defp
IO.puts("")
IO.puts("Private functions in modules")
defmodule Math2 do
  def sum(a,b) do
    do_sum(a,b)
  end

  defp do_sum(a,b) do
    a+b
  end
end

IO.puts(Math2.sum(1,2))
IO.puts("Math2.do_sum(1,2) -> undefinedFunctionError")

#Guards and clauses in functions
# "zero?" convention name to indicate that a boolean value is returned
IO.puts("")
IO.puts("Guards and clauses in functions")
defmodule Math3 do
  def zero?(0) do
    true
  end

  def zero?(x) when is_integer(x) do
    false
  end
end

IO.puts(Math3.zero?(0))
IO.puts(Math3.zero?(1))
IO.puts("Math3.zero?([1,2,3]) -> **(FunctionClauseError)")
IO.puts("Math3.zero?(0.0) -> **(FunctionClauseError)")

#Function Capturing
#Retrieve a named function as a function type
IO.puts("")
IO.puts("Function Capturing")
IO.puts("Math3.zero?(0) -> #{Math3.zero?(0)}")
fun=&Math3.zero?/1
IO.puts("fun=&Math3.zero?/1 -> #{inspect(fun)}")
IO.puts("is_function(fun) #{is_function(fun)}")
IO.puts("fun.(0) -> #{fun.(0)}")

#Shortcut for creating functions with &
#&1 -> represents the first argument passed into the function.
IO.puts("")
IO.puts("Shortcut for creating functions")
fun=&(&1+1)
IO.puts("fun=&(&1+1)")
IO.puts("fun.(1) -> #{fun.(1)}")
fun2=&"Good #{&1}"
IO.puts("fun2.(\"kelium\") -> #{fun2.("kelium")}")

#Default Arguments
IO.puts("")
IO.puts("Default Arguments in functions")
defmodule Concat do
  def join(a,b,sep\\" ") do
    a<>sep<>b
  end
end

IO.puts(Concat.join("Hello","World"))
IO.puts(Concat.join("Hello","World","_"))

#Default values has multiple clauses it is required to create  a fnction head.
IO.puts("")
IO.puts("Default values has multiple clauses")
defmodule Concat2 do
  def join(a,b\\nil,sep\\" ")
  def join(a,b,_sep) when is_nil(b) do
   a 
  end
  def join(a,b,sep) do
    a<>sep<>b
  end
end
IO.puts(Concat2.join("Hello","World"))
IO.puts(Concat2.join("Hello","world","_"))
IO.puts(Concat2.join("Hello"))
#Note "_sep" emans that the variable will be ignored in this function
