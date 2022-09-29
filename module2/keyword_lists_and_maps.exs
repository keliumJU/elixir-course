#Keyword lists and maps

#Interactive mode iex, but instead i will write everything that the interactive mode shows with an IO.puts

#*Keywords lists
#*keywords lists: associative data structure are able to associate a key to a certain value.
IO.puts("Keywords lists")
list=String.split("1 2 3", " ")
IO.puts("String.split(\"1 2 3\", \" \") -> #{inspect(list)}")
IO.puts("string of integers with extra spaces: ")
list=String.split("1  2  3"," ") 
IO.puts("String.split(\"1  2  3\", \" \") -> #{inspect(list)}")
IO.puts("Solve with a keyword lists")
list=String.split("1  2  3", " ", [trim: true])
IO.puts("String.split(\"1  2  3\", \" \", [trim: true] -> #{inspect(list)}")

#Composition: 
#keywords lists are 2-item tuples: 
# *first element(key) is an atom  
# *second element can be any value
IO.puts("Composition keywords lists")
IO.puts("[{:trim, true}] == [trim: true] -> #{[{:trim, true}] == [trim: true]}")
IO.puts("Operations available to lists: ")
list = [a: 1, b: 2]
IO.puts("list: #{inspect(list)}")
IO.puts("--add new values to a keyword list: ")
IO.puts("list ++ [c: 3] -> #{inspect(list ++ [c: 3])}")
IO.puts("[a: 0] ++ list -> #{inspect([a: 0] ++ list)}")
IO.puts("--read the value of a keyword list: ")
IO.puts("list[:a] -> #{inspect(list[:a])}")
IO.puts("list[:b] -> #{inspect(list[:b])}")
IO.puts("--duplicate keys, values added to the front")
new_list = [a: 0] ++ list
IO.puts("[a: 0] ++ list #{inspect(new_list)}")
IO.puts("new_list[:a] -> #{new_list[:a]}") 
#*Notes: keyword lists characteristics:
# 1. keys must be atoms
# 2. keys are ordered by developer 
# 3. keys can be given more than once.
IO.puts("--pattern match requires the number of items and their order to match: ")
list = [a: a]=[a: 1]
IO.puts("[a: a] = [a: 1] -> #{inspect(list)}")
IO.puts("a -> #{a}")

#*Maps
#*Maps: key value store, maps are the "go to" data structure in Elixir %{} 
IO.puts("")
IO.puts("Maps")
map=%{:a => 1, 2 => :b}
IO.puts("map = %{:a => 1, 2 => :b} -> #{inspect(%{:a=>1,2=>:b})}")
IO.puts("map[:a] -> #{map[:a]}")
IO.puts("map[:c] -> #{map[:c]} nil")
#Notes: Map characteristics:
# 1. Maps allow any value as a key
# 2. Maps keys do not follow any ordering
IO.puts("--Pattern matching")
IO.puts("%{} = %{:a => 1, 2 => :b} -> #{inspect(%{} = %{:a => 1, 2 => :b})}")
IO.puts("%{:a => a} = %{:a => 1, 2 => :b} -> #{inspect(%{:a => a} = %{:a => 1, 2 => :b})}")
IO.puts("a var -> #{a}")
IO.puts("Variables used in matching: ")
n = 1
IO.puts("n = 1 -> #{n}")
IO.puts("%{n=>:one} -> #{inspect(%{n => :one})}")
IO.puts("map[n] -> #{map[n]}")
IO.puts("--Pin variable value")
IO.puts("%{^n=>:one}=%{1=>:one,2=>:two,3=>:three} -> #{inspect(%{^n => :one} = %{1 => :one, 2 => :two, 3 => :three})}")

#The Map module
IO.puts("")
IO.puts("The Map module: ")
value=Map.get(%{:a=>1,2=>:b},:a)
IO.puts("Map.get(%{:a=>1,2=>:b},:a) -> #{value}")
new_map=Map.put(%{:a=>1,2=>:b},:c,3)
IO.puts("Map.put(%{:a=>1,2=>:b},:c,3) -> #{inspect(new_map)}")
map_to_list=Map.to_list(%{:a=>1,2=>:b})
IO.puts("Map.to_list(%{:a=>1,2=>:b}) -> #{inspect(map_to_list)}")

#Update the key's value
IO.puts("")
IO.puts("Update the key's value")
map=%{:a=>1,2=>:b}
IO.puts("#{inspect(map)}")
map_new_val=%{map|2=>"two"}
IO.puts("%{map|2=>\"two\"} -> #{inspect(map_new_val)}")
IO.puts("--Accessing atom keys: ")
map=%{:a=>"marte",2=>:b}
IO.puts("#{inspect(map)}")
IO.puts("map.a -> #{map.a}")

#*do-blocks and keywords
#in one line: 
IO.puts("")
IO.puts("--One line conditional")
conditional=if true, do: "this will be seen", else: "this won't"
IO.puts(conditional)

#Nested data structures
#maps in maps or list and maps
IO.puts("")
IO.puts("Nested data structures ...")
users = [
  john: %{name: "John", age: 27, languages: ["Erlang", "Ruby", "Elixir"]},
  mary: %{name: "Mary", age: 29, languages: ["Elixir", "F#", "Clojure"]}
]
IO.inspect(users)
IO.puts("Acces the age of jhon: ")
IO.puts("users[:john].age -> #{users[:john].age}")
IO.puts("Updating the value with put_in macro: ")
users = put_in(users[:john].age,31)
IO.inspect(users)
IO.puts("remove one language from Mary's list with update_in/2")
users = update_in(users[:mary].languages, fn languages ->
  List.delete(languages, "Clojure") end)
IO.inspect(users)
