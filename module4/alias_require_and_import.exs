#Alias, require, and import

IO.puts("")
IO.puts("Facilitate software resuse directives -> alias, require, import and use")

alias Foo.Bar, as: Bar
IO.puts("Foo.bar, as: Bar")
IO.puts("Bar -> #{inspect(Bar)}")
IO.puts("Now only call Bar instead of Foo.Bar")
IO.puts(Bar)

require Foo 
#-> it must exist to uses your macros
import Foo 
#-> it must exist to import functions from Foo so they can be called with the prefix 
use Foo
#-> invokes the custom code defined in Foo as an extension point
#
IO.puts("using without the prefix Foo the function func/0")
IO.puts("func() -> #{func()}")
#Notes: the first three are called directives because they have lexical scope 
#alias
IO.puts("")
IO.puts("*alias")
IO.puts("the alias directive allows referring to Math.list just as List")
defmodule Stats do
  alias Math.List, as: List
  IO.inspect(List)
end
#the alias automatically takes the last part of the module name
alias Math.List
IO.inspect(List)
#Note: the alias only affects the context where it was created

#require
IO.puts("")
IO.puts("*require")
IO.puts("In order to use macros, you need to opt-in by requiring the module they are defined in.") 
IO.puts("Integer.is_odd(3) -> be sure to require Integer is a macro")
require Integer
IO.puts("require Integer")
IO.puts("Integer.is_odd(3) -> #{Integer.is_odd(3)}")
#Note: require is also lexically scoped

#import
IO.puts("")
IO.puts("*import")
IO.puts("whenever we want to access functions or macros form other modules without using the fully-qualified name")
#Note: the library Math must first be installed
IO.puts("import Math.List, only: [duplicate: 2] -> List")
IO.puts("duplicate(:ok, 3) -> [:ok,:ok,:ok]")
#Notes:
# 1. import is lexically scoped too
# 2. when working on your own code, prefer alias to import :)

#use
IO.puts("")
IO.puts("*use")
IO.puts("\"use\" macro is frequently used as an extension point.")
IO.puts("What does it mean? -> this means that, when you \"use\" a module \n \"FooBar\", you allow that module to inject <any> code in the current moudle ...??")
IO.puts("example: importing itself or other modules, defining new functions,\n setting a module state ..(sounds like inheritance and polyomrphism to me)")
IO.puts("ExUnit.Case: ")
IO.puts("defmodule AssertionTest do \n  use Exunit.Case, async: true\n
    test \"always pass\" do\n       assert true\n    end\nend") 

#example use:       
#first we create an external module called "Feature" and internally we define a function to use, 
#then we compile it and call it inside the example module that will be executed with .exs
defmodule Example do
  use Feature 
end

#understanding Aliases
IO.puts("")
IO.puts("Understanding Aliases")
IO.puts("An alias is a capitalized identifier(String, Keyword ...)")
IO.puts("It's converted to an atom during compilation")
IO.puts("is_atom(String) -> #{is_atom(String)}")
IO.puts("to_string(Stirng) -> #{to_string(String)}")
IO.puts("\"Elixir.String\" == String -> #{:"Elixir.String" == String}")

#Module nesting
IO.puts("")
IO.puts("Module nesting")
IO.puts("review the file module_foo.ex")
IO.puts("modules are independent so they do not have to be defined \n
  within the parent module -> review the file module_ind.ex")

#Multi alias/import/require/use  
IO.puts("")
IO.puts("Multi alias/import/require/use")
IO.puts("alias,import,require or use multiple modules at one?")
IO.puts("yes, this is particulary useful we start nesting modules,\n
  which is very common when building Elixir applications.")
IO.puts("all modules are nested under MyApp, you can alias the modules \n
    MyApp.Foo, MyApp.Bar and MyApp.Baz at once")
IO.puts("review the module_multi_alias.ex")

IO.inspect(alias MyApp.{Foo,Bar,Baz})
IO.inspect(Foo)
IO.inspect(Bar)
IO.inspect(Baz)
