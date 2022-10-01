#Structs

#review maps
IO.puts("")
IO.puts("Structs")
IO.puts("review maps") 
map=%{a: 1,b: 2}
IO.puts("map = %{a: 1, b: 2} -> #{inspect(map)}")
IO.inspect(map[:a])
IO.inspect(%{map | a: 3})

#Defining structs
IO.puts("")
IO.puts("Defining structs")
IO.puts("review the file user.exs")
IO.puts("defstruct keyword defines fields with their default values")
IO.puts("structs take the name of the module \"User\"")
#IO.inspect(c "user.exs")
IO.inspect(%User{})
IO.inspect(%User{name: "Jane"})
#Note: Structs provide compile-time guarantees that only the fields(and all of them) will be allowed to exist in a struct
IO.puts("%User{oops: :field} -> not found key")

#Accessing and updating structs
IO.puts("")
IO.puts("Accessing and updating structs")
IO.puts("the same map techniques apply to structs") 
john=%User{}
IO.inspect(john)
IO.inspect(john.name)
jane=%{john | name: "Jane"}
IO.inspect(jane)
#pattern matching
#constrains:
# 1. matching on the value of specific keys
# 2. ensuring that the matching value is a struct of the same type as the matched value
IO.puts("")
IO.puts("pattern matching -->")
IO.inspect(%User{name: name} = john)
IO.inspect(name)

#Structs are bare maps underneath
IO.puts("")
IO.puts("Structs are bare maps underneath")
IO.puts("is_map(john) -> #{is_map(john)}")
IO.puts("john.__struct__  -> #{john.__struct__}")
#Note: structs are bare maps becuse none of the protocols implemented for maps are available for structs.
IO.puts("")
IO.puts("--difference with map")
john = %User{}
IO.inspect(john)
IO.puts("john[:name] -> protocol Enumerable not implemented for struct")

#Structs and the Map module
IO.puts("")
IO.puts("Structs are just maps, they work with the functions from the Map module")
IO
jane = Map.put(%User{}, :name, "Jane")
IO.inspect(jane)
IO.puts("change name with Map.merge/2")
IO.inspect(Map.merge(jane, %User{name: "John"}))

#Default values and required keys
IO.puts("")
IO.puts("Default values and required keys")
IO.puts("If don't specify a default key value nil will be assumed")
IO.puts("review the file: product.exs") 
IO.inspect(%Product{})
IO.inspect(%UserDefault{})
#enforce that certain keys have to be specified when creating the struct
IO.puts("")
IO.puts("enforce keys values")
car = %Car{make: 1}
IO.inspect(car)
