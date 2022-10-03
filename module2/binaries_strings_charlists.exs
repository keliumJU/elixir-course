#Binaries, strings and charlists

#Interactive mode iex, but instead i will write everything that the interactive mode shows with an IO.puts

#*Binary exapmle with string
IO.puts("Example binary string")
string="hello"
IO.puts("string = \"hello\"")
IO.puts("is_binary(string) -> #{is_binary(string)}") 

#*Unicode and Code points
#*Unicode standard: acts as an official registry of virtually all the characters we know
#*Code point: numerical index into code charts of the all characters
IO.puts("")
IO.puts("Code point example: ")
IO.puts("?a -> #{?a}")
IO.puts("?x -> #{?x}")

#*UTF-8 and Encodings
#*Code point: What we store
#*Encoding: How we store(implementation)
#*Thus we need a mechanism to convert the code point numbers into bytos so they can be stored i memory, writen to disk ...
#*UTF-8: is a variable with character encoding that uses one to four bytes to store each code point.   
IO.puts("")
IO.puts("Example UTF-8 in action: ") 
string = "héllo"
IO.puts("string = \"héllo\" -> #{string}")
IO.puts("Graphemes String.length(string) -> #{String.length(string)}")
IO.puts("byte_size(string) -> #{byte_size(string)}")
IO.puts("binary representation: )")
IO.puts("\"hello\" <> <<0>> -> #{inspect("hello" <> <<0>>)}")

#*BitStrings
#*Bitstrings: Contiguous sequence of bits in memory
IO.puts("")
IO.puts("Specify the number of bits via a ::n where n is the new size(bits) or with the declaration ::size(n)")
IO.puts("<<42>> == <<42::8>> -> #{<<42>> == <<42::8>>}")
IO.puts("<<3::4>> -> #{inspect(<<3::4>>)}")
IO.puts("--key example: save the binary rep of the decimal number 3(0011)")
IO.puts("<<0::1, 0::1, 1::1, 1::1>> == <<3::4>> #{<<0::1,0::1,1::1,1::1>>==<<3::4>>}")

#*Binaries
#*Binaries: is a bitstring where the number of bits is divisible by 8
# note: every binary is a bitstring, but not every bitstring is a binary
IO.puts("")
IO.puts("Binaries: ")
IO.puts("is_bitstring(<<3::4>>) -> #{is_bitstring(<<3::4>>)}")
IO.puts("is_binary(<<3::4>>) -> #{is_binary(<<3::4>>)}")
IO.puts("is_binary(<<0,255,42>>) -> #{is_binary(<<0,255,42>>)}")
IO.puts("is_binary(<<42::16>>) -> #{is_binary(<<42::16>>)}")
IO.puts("--pattern match on binaries: ")
<<0,1,x>> = <<0, 1, 2>>
IO.puts("<<0,1,x>> = <<0,1,2>>: ") 
IO.puts("x: -> #{x}")  
IO.puts("--Match on a binary of unknown size use \"binary\" modifier")
<<0,1,x::binary>> = <<0,1,2,3>>
IO.puts("<<0,1,x::binary>> = <<0,1,2,3>>: ")
IO.puts("x: -> #{inspect(x)}")
IO.puts("--pattern matches list style: ")
IO.puts("<<head::binary-size(2), rest::binary>> = <<0,1,2,3>>")
<<head::binary-size(2), rest::binary>> = <<0,1,2,3>>
IO.puts("head: #{inspect(head)}")
IO.puts("rest: #{inspect(rest)}")
IO.puts("--binary concatenation <>")
IO.puts("<<0,1>> <> <<2,3>> -> #{inspect(<<0,1>> <> <<2,3>>)}")
IO.puts("--string are binaries, pattern match on string: ")
IO.puts("<<head,rest::binary>> = \"banana\" -> ")
<<head,rest::binary>> = "banana"
IO.puts("head: #{head}")
IO.puts("rest: #{rest}")  
IO.puts("head == ?b -> #{head==?b}")
IO.puts("--multibyte example: ")
bin = "ü"<> <<0>>
IO.puts("bin: #{inspect(bin)}")
<<x::utf8, rest::binary>> = "über"
IO.puts("for multibyte character is important to use the utf8 modifier")
IO.puts("<<x::utf8, rest:binary>> = \"über\"")
IO.puts("x == ?ü -> #{x==?ü}")
IO.puts("rest: #{rest}")

#*Charlists
#*Charlist: is a list of integers where all integers are valid code points ASCII range
IO.puts("")
IO.puts("Charlist")
IO.puts("'hello'")
IO.puts("[?h, ?e, ?l, ?l,?o] -> #{[?h, ?e, ?l, ?l, ?o]}")
IO.puts("is_list('hello') -> #{is_list('hello')}")
heartbeats_per_minute = [99, 97, 116]
IO.puts("heartbeats_per_minute = [99,97,116]")
IO.puts("heartbeats_per_minute -> #{heartbeats_per_minute}")
IO.puts("--the bests functions in elixir are polymorphic: ")
IO.puts("to_string('hello') -> #{inspect(to_string('hello'))}")
IO.puts("to_charlist(\"hello\") -> #{inspect(to_charlist("hello"))}")
IO.puts("--concatenation of charlists ++")
IO.puts("'this' ++ 'works' ->  #{'this' ++ ' works'}") 
