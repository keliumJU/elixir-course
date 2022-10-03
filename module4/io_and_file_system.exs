#IO and the file system

#The IO module
IO.puts("The IO module")
IO.puts("main mechanism in Elixir for reading and writing to standar input/output(:stdio), standar error(:stderr), files and other IO devidces")
IO.puts("Hello world")
#input = IO.gets("yes or not? ")
#capture input user
#IO.puts("this is input -> #{input}")
#write to the standard error device
IO.puts("Write in standar error")
IO.puts(:stderr, "hello world")

#The File module
IO.puts("")
IO.puts("File module")
IO.puts("files are opened in binary mode use IO.binread/2, IO.binwrite/2")
#Note: if it doesn't exist create it
{:ok, file} = File.open("hello.txt", [:write])
IO.inspect({:ok, file})
IO.binwrite(file, "world")
File.close(file)
IO.inspect(File.read("hello.txt"))
#Note: File module has many functions to work with the file system ->
# File.rm/1, File.mkdir/1, File.cp_r/2, File.rm_rf/1 ...

IO.puts("")
IO.puts("File.read with ! -> File.read!")
IO.inspect(File.read("hello.txt"))
IO.inspect(File.read("unknown.txt"))
IO.puts("File.read! -> returns the contents of the file instead of a tuple")
IO.inspect(File.read!("hello.txt"))
IO.puts("File.read!(\"unknown.txt\" -> return an error that stops the program") 
#Note it is an uncontrolled error

#The Path module
IO.puts("")
IO.puts("The Path module")
IO.puts("provides facilities for working with paths")
IO.inspect(Path.join("foo","bar"))
#Nice function Path.expand/1
IO.inspect(Path.expand("~/hello"))

#Processes and IO 
IO.puts("")
IO.puts("Processes and IO")
IO.puts("the IO module works with processes")
IO.inspect({:ok, file} = File.open("hello.txt", [:write]))
#Note: you write to a a file that has been closed?, you are sending a message to a process dead"
IO.inspect(File.close(file))
#IO.write(file, "is anybody out there") -> generate :error

#iodata and chardata
IO.puts("")
IO.puts("iodata and chardata")
IO.puts("when use binaries when writing to files. but also we can use iodata and chardata")
#Note: reason for use iodata or chardata -> performance
name="Mary"
IO.puts("this operation is expensive for large strings!")
IO.puts("\"Hello \"<>name<>\"!\" -> #{"Hello "<>name<>"!"}")
IO.puts("We can passinstead a list of strings")
IO.puts("[\"hello \",name,\"!\"] -> #{["hello ",name,"!"]}")
#Note: we create a list that contains the original name.
#Note2: we call such list either "iodata" or "chardata"

#Enum example
IO.puts("")
IO.puts("Enum example pass a list of strings")
IO.inspect(Enum.intersperse(["apple","banana","lemon"],","))

#iodata and cardata may also contain integers, print our comma separate list of values by using <?,> as separator
IO.puts("")
IO.puts("iodata and chardata with integers")
IO.puts(["apple", ?,, "banana", ?,, "lemon"])
IO.puts("?, -> #{?,}")

#differences iodata and chardata
#iodata: integers represents bytes
#chardata: integers represent Unicode codepoints.
#warning -> you only need to worry about these deatils if you intend to pass lists containing integers ...
IO.puts("")
IO.puts("default IO device works with chardata")
IO.puts([?O, ?l, ?a, ?\s, "Mary", ?!])
IO.puts(["O", "l", "a", " ", "Mary", "!"])

#charlist->special case of chardata
IO.puts("")
IO.puts("charlist")
IO.puts("List in which all of its values are integers -> representing Unicode codepoints.")
IO.puts("~c\"hello\" -> #{~c"hello"}")
#Note: ~c -> sigil operator List of integers are automatically printed if are ASCII codepoints
IO.puts("Any list containing printable ASCII codepoints -> printed as a charlist")
IO.puts("[?a, ?b, ?c] -> #{[?a,?b,?c]}")
