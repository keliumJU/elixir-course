#Module attributes

IO.puts("")
IO.puts("Module attributes")
IO.puts("purposes: ")
IO.puts("1. serve to annotate the module")
IO.puts("2. work as constants")
IO.puts("3. work as temporary module storage to be used during compilation")

#As annotations
defmodule Myserver do
  @moduledoc "My server code."
end
#notes: most commonly used ones:
#1. @moduledoc -> documentation for the current module
#2. @doc -> documentation for the function or macro
#3. @spec -> provides a typespec for the function that follows the attribute.
#4. @behaviour specifying an OTP
IO.puts("")
IO.puts("Annotations")
IO.puts("review the file math.ex")
IO.puts(Math)
IO.puts(Math.sum(1,2))

#As "constants"
IO.puts("")
IO.puts("As \"constants\"")
IO.puts("module attributes when they wish to make a value more visible or reusable :)")

defmodule Myserver do
  #always defined
  @initial_state %{host: "127.0.0.1", port: 3456}
  IO.inspect @initial_state
end

#Read inside functions
defmodule MyServer do
  @my_data 14
  def first_data, do: @my_data
  @my_data 13
  def second_data, do: @my_data
end

IO.inspect(MyServer.first_data)
IO.inspect(MyServer.second_data)

IO.puts("")
#Functions may be called when defining a module attribute
#defmodule MyApp.Status do
#  @service URI.parse("https://example.com")
#  def status(email) do
#    someHttpClient.get(@service)
#  end
#end
defmodule Service do
  @service_url "https://example.com"
  def open() do
    clientHttp(@service_url)
  end
  defp clientHttp(url) do
    url<>"/calc"
  end
end

IO.inspect(Service.open())
#Note important:
# 1. functions defined in the same module as the attribute itself
# cannot be called because they have not yet been compiled when the attribute
# is being defined.
# 2. If you want to use an annotation constant in several functions, 
# it is better to create a function that returns this constant, 
# to avoid the compiler creating multiple copies each time it is called by a different function.

#Accumulating attributes
IO.puts("")
IO.puts("Accumulating attributes")
IO.puts("Configure the module attribute so that its values are accumulated")

defmodule Foot do
  Module.register_attribute __MODULE__, :param, accumulate: true
  
  @param :foo
  @param :bar
  
  IO.inspect(@param)
end

#As temporary storage
IO.puts("")
IO.puts("As temporary storage")
IO.puts("Example with Elixir's unit test framework \"ExUnit\"")

ExUnit.start()

defmodule MyTest do
  use ExUnit.Case, async: true

  @tag :external
  @tag os: :unix
  
  test "contacts external service" do
    #...
  end
end
#Explanation: Exunit stores the value of async: true ina module attribute
#Tags are also defined as accumulate: true and they store tags that can be 
#used to setup and filter test
