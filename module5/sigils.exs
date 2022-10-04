#Sigils
IO.puts ""
IO.puts "~Sigils"
#Note: ~<char>
IO.puts "Regular expressions"
regex = ~r/foo|bar/
IO.puts "regex = ~r/foo|bar/ -> #{inspect regex}"
IO.puts "\"foo\" =~ regex -> #{"foo" =~ regex}"
#Note: Elixir provides Perl-compatible regular expresions(regexes)
IO.puts "example with modifier 'i'"
IO.puts "\"HELLO\" =~ ~r/hello/ -> #{"HELLO" =~ ~r/hello/}"
IO.puts "\"HELLO\" =~ ~r/hello/i -> #{"HELLO" =~ ~r/hello/i}"
#Note: ~sigils support 8 different delimitiers

IO.puts ""
IO.puts "Strings, char lists, and word lists sigils"
IO.puts "Strings -generate"
IO.inspect ~s(this is a string with "double" quotes, not 'single' ones)
IO.puts "Char lists"
IO.inspect ~c(this is a char list containing 'single quotes')
IO.puts "Word lists"
IO.inspect ~w(foo bar bat)
#Note: accepts the c,s and a modifiers(for char lists, strins, and atoms
IO.inspect ~w(foo bar bat)a
  
IO.puts ""
IO.puts "Interpolation and escaping in string sigils"
IO.puts "a Sigil with an uppercase character does not allow interpolation and escaping codes"
IO.inspect ~s(String with escape codes \x26 #{"inter"<>"polation"})
IO.inspect ~S(String without escape codes \x26 without #{interpolation})  

# heredocs
IO.puts ""
IO.puts "heredocs"
IO.inspect ~s"""
  this is 
  a heredoc string
"""
#Note: The most common use case is for writing documentation. for example
#writing escape characters
defmodule DocExample do
  #'~S' literally output escape characters
  @doc ~S"""
    Coverts double-quotes to single-quotes.
    ## Examples
    iex> convert("\"foo\"")
    "'foo'"
  """  
  def convert(cad) do
    cad 
  end
end

#Calendar sigils
IO.puts ""
IO.puts "Calendar sigils"
IO.puts "Date -> year/month/day"
d = ~D[2022-10-10]
IO.inspect d 
IO.inspect d.day

IO.puts ""
IO.puts "Time -> hour:minute:second:microsecond"
t = ~T[23:00:07.0]
IO.inspect t
IO.inspect t.second

IO.puts "NaiveDateTime"
IO.puts "fields from both Date and Time"
ndt = ~N[2022-10-10 23:00:07]
IO.inspect ndt
#Note: Not contain timezone information

IO.puts ""
IO.puts "UTC DateTime"
IO.puts "%DateTime{} struct contains the same fields as a NaiveDateTime
with the addition of fields to track timezones"
dt = ~U[2022-10-10 19:59:03Z]
IO.inspect dt
%DateTime{day: day, minute: minute, time_zone: time_zone} = dt
IO.inspect day
IO.inspect minute
IO.inspect time_zone

#Custom sigils
IO.puts ""
IO.puts "Custom sigils"
IO.puts "sigil_r sigils in Elixir are extensible."
IO.inspect sigil_r(<<"foo">>,'i')
IO.puts "Provide our own sigils by implementing functions that follow: 
sigil_{character} pattern. with modifier <n>"

import MySigils
IO.inspect ~i(13)
IO.inspect ~i(42)n
