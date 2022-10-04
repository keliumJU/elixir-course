#try_catch_and_rescue

IO.puts ""
IO.puts "Try Cath and rescue"

IO.puts""
IO.puts"Errors or exceptions"
IO.puts"--Used when exceptional things happen in the code"
IO.puts"runtime error can be raised with raise/1"
IO.puts"raise \"oops\" -> raie ArgumentError ..."
IO.puts"--Define own errors review file my_error.ex"
IO.puts"raise MyError -> (MyError) default message"

#Rescued try/rescue
IO.puts""
IO.puts"Rescued try/rescue construct"
err=try do
  raise "oops"
rescue
  e in RuntimeError -> e
end
IO.inspect err

#Elixir provides a File.read/1 function with return a tuple containg
#information about whether the file was opened successfully
IO.inspect File.read("hello")
IO.inspect File.write("hello","world")
IO.inspect File.read("hello")

#Example when you want to handle multiple outcomes of opening a file.
#use "pattern matching" and "case" construct
IO.puts""
IO.puts"Example with pattern matchin"
case File.read("hello") do
  {:ok, body} -> IO.puts("Success: #{body}")
  {:error, reason} -> IO.puts("Error: #{reason}")
end

#Fail fast/ Let it crash
IO.puts"Fail fast/ Let it crash"
IO.puts"Let it be, In case something unexpected happens,
it is best to let the exception happen, without rescuing it"
#Note: At the end of the day, "fail fast"/"let it crash" is a way of
#saying that, when something unexpected happens, it is best to start from
#scratch within a new processes, reshly started by a supervisor.

#Reraise
IO.puts""
IO.puts"Reraise"
IO.puts"You want to log that something went wrong"
try do
  ###some code
  
#rescued the exception, logged it, and then re-raised it
rescue
  e -> 
    Logger.error(Exception.format(:error, e, __STACKTRACE__))  
    reraise e, __STACKTRACE__
end  

#Twhrows
IO.puts""
IO.puts"Throws"
IO.puts"--throw and catch are reserved for situations where it is not
  possible to retrieve a value unless by using throw and catch."
IO.puts"--example: find the first multiple of 13 in a list of numbers"

ans = try do
  Enum.each(-50..50, fn x ->
    if rem(x,13) == 0, do: throw(x)
  end)
  "Got nothing"
catch 
  x -> "Got #{x}" 
end

IO.inspect ans
IO.puts "is the way to go:"
ans=Enum.find(-50..50, &(rem(&1, 13))==0)
IO.inspect ans

#Exits
IO.puts""
IO.puts"Exits"
IO.puts"--when a process dies \"natural causes\", it sends an exit signal"
#IO.inspect spawn_link(fn -> exit(1) end)
IO.puts"--exitt can also be \"caught\" using try/catch"
#ans = try do
#  exit("I am exiting")
#catch
#  :exit, _ -> "not really"
#end
#IO.inspect ans
#Note: signals are a an important part of the faul tolerant system provided
#by the Erlang VM.
#--Instead of rescuing an error, we'd rather "fail fast" since the supervision tree
#will guarantee our application will go back to a known initial state after the error. 

#After
IO.puts""
IO.puts"After"
IO.puts"--ensure that a resource is cleaned up after some action that
could potentially raise an error"

{:ok, file} = File.open("sample", [:utf8, :write])
#try do
#  IO.write(file, "ola")
#  raise "oops, something went wrong"
#after
#  File.close(file)
#end
#Note: Luckily, files in Elixir are also linked to the current processes
#and therefore they will always get closed if the current process
#crashes, independent of the after clause.

#Else
IO.puts""
IO.puts"Else"
x=2
ans=try do
  1/x
rescue
  ArithmeticError ->
    :infinity
else
  y when y < 1 and y > -1 ->
    :small
  _ ->
    :large  
end
IO.inspect ans

#Variables scope
IO.puts""
IO.puts"Variables scope"
IO.puts"--variables defined inside try/catch/rescue/after blocks
do not leak to the outer context"
what_happened=
  try do
    raise "fail"
    :did_not_raise
  rescue
    _ -> :rescued
  end
IO.inspect what_happened
#Note: furthermore, variables defined in the do-block of try
#are not available inside rescue/after/else. because try block
#may fail at any moment.
