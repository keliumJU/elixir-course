#Basic Operators 

#Interactive mode iex, but instead i will write everything that the interactive mode shows with an IO.puts

#Booleans operators
IO.puts("Elixir provides three booleans operators: or, and, not")
IO.puts("true and true -> #{true and true}")
IO.puts("false or is_atom(:example) -> #{false or is_atom(:example)}")
IO.puts("--No boolean produces exceptions")
IO.puts("1 and true -> raise exception")

#Other boolean operators for any type
IO.puts("")
IO.puts("Other boolean operators for any type: ||, && and ! ")
IO.puts("1 || true -> #{1 || true}")
IO.puts("false || 11 -> #{false || 11}")
IO.puts("nil && 13 -> #{nil && 13} nil")
IO.puts("true && 17 -> #{true && 17}")
IO.puts("!true -> #{!true}")
IO.puts("!1 -> #{!1}")
IO.puts("!nil -> #{!nil}")

#Comparison operators: 
IO.puts("")
IO.puts("Comparison operators: ")
IO.puts("1 == 1 -> #{1 == 1}")
IO.puts("1 != 2 -> #{1 != 2}")
IO.puts("1 < 2 -> #{1 < 2}")
IO.puts("Strict operator ===")
IO.puts("1 == 1.0 -> #{1 == 1.0}")
IO.puts("1 === 1.0 -> #{1 === 1.0}")

#Compare two different data types
IO.puts("")
IO.puts("compare different data types")
IO.puts("1 < :atom -> #{1 < :atom}")
IO.puts("Base in sorting order, from lower to higher: ")
IO.puts("number, atom, reference, function, port, pid, tuple, map, list, bitstring")
