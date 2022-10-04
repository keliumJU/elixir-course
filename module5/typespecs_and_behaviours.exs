#Typespecs and behaviours

IO.puts""
IO.puts"Types and specs"
IO.puts"1. declaring typed function signatures"
IO.puts"2. declaring custom types"

#Function specifications
IO.puts""
IO.puts"Function specifications"
#typed signature round/1 -> round(number()) :: integer()

#Defining custom types
IO.puts""
IO.puts"Defining custom types"
IO.puts"--Can help communicate the intention of your code and increase its readability."
IO.puts"->Defined within modules via the @type attribute"
IO.puts"More descriptive alias ... review the file person.ex"

#defining custom maps
IO.puts""
IO.puts"Custom maps"
defmodule CustomMap do
  @type error_map :: %{
    message: String.t,
    line_number: integer
  }
end

IO.puts""
IO.puts"Lousy calculator"
#example module "Lousy Calculator"
defmodule LousyCalculator do
  @spec add(number,number) :: {number, String.t}
  def add(x, y), do: {x+y, "You need a calculator to do that?!"}

  @spec multiply(number,number) :: {number, String.t}
  def multiply(x,y), do: {x*y, "Jezz, come on!"}
end

#now with @type to avoid the repetition
defmodule LousyCalculator do
  @typedoc"""
  Just a number followed by a string.
  """
  @type number_with_remark :: {number, String.t}
  
  @spec add(number,number) :: number_with_remark
  def add(x,y), do: {x+y, "You need a calculator to do that?!"}  

  @spec multiply(number,number) :: number_with_remark
  def multiply(x,y), do: {x*y, "It is like addition on steroids."}
end
#review the file lousy_calculator.ex and quiet_calculator

#Behavioiurs
IO.puts""
IO.puts"Behaviours"
IO.puts"1. define a set of functions that have to be implemented by a module"
IO.puts"2. ensure that a module implements all the functions int that set."

#defining behaviours
IO.puts""
IO.puts"Defining behaviours"
IO.puts"example \"Parser behaviour\""

defmodule Parser do
  @doc"""
  Parses a string.
  """
  @callback parse(String.t)::{:ok, term}|{:error,String.t}
  
  @doc"""
  List all supported file extensoins.
  """
  @callback extensions() :: [String.t]
  
end
#Note: @callback expects a function name but also a function specification
#like the ones used with the @spec attribute.
#in Elixir "term" type is a shorcut to represent any type

#Adopting behaviours
IO.puts""
IO.puts"Adopting behaviours"

defmodule JSONParser do
  @behaviour Parser
  @impl Parser
  def parse(str), do: {:ok, "some json" <> str} # ... parse JSON

  @impl Parser
  def extensions, do: ["json"]
end

defmodule YAMLParser do
  @behaviour Parser
  @impl Parser
  def parse(str), do: {:ok, "some yaml"<>str} #...parse YAML

  @impl Parser
  def extensions, do: ["yml"]
end
#Note: With @impl you can also make sure that you are implementing the correct callbacks from the given behaviour

#Dynamic dispatch
IO.puts""
IO.puts"Dynamic dispatch"
IO.puts"Behaviours are frequently used with dynamic dispatching"

defmodule Parser do
  @callback parse(String.t) :: {:ok, term} | {:error, String.t}
  @callback extensions() :: [String.t]

  def parse!(implementation, contents) do
    case implementation.parse(contents) do
      {:ok, data} -> data
      {:error, error} -> raise ArgumentError, "parsing error: #{error}"
    end
  end
end
