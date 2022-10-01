defmodule Car do
  @enforce_keys [:make]
  defstruct [:model, :make]
end
