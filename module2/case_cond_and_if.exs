#Case cond and if

#Interactive mode iex, but instead i will write everything that the interactive mode shows with an IO.puts

#Case
IO.puts("Compare a value against many patterns until we find a matching one: ")
ans = case {1,2,3} do
  {4,5,6} -> "this clause won't match"
  {1,_x,3} -> "this clause will match bind x to 2 int this clause"
  _ -> "this clause would match any value"
end
IO.puts(ans)

#Case with existing variable
IO.puts("")
IO.puts("pattern match an existing variable")
x=1
ans=case 10 do
  ^x -> "Won't match"
  _ -> "will match"
end
IO.puts(ans)

#guards in clauses for extra conditions
IO.puts("")
IO.puts("guards in clauses for extra conditions")
ans=case {1,2,3} do
  {1,x,3} when x>0 -> "Will match"
  _ -> "Would match, if guard condition were not satisfied"
end
IO.puts(ans)

#Anonymous functions with multiple clauses and guards
IO.puts("")
IO.puts("Anonymous functions with multiple clauses and guards")
f=fn
  x,y when x>0 -> x+y
  x,y -> x*y
end
IO.puts("f.(1,3) -> #{f.(1,3)}")
IO.puts("f.(-1,3) -> #{f.(-1,3)}")

#cond 
IO.puts("")
IO.puts("check different conditions and find first that does not evaluate to nil or false")

ans=cond do
  2+2 == 5 -> "This will not be true"
  2*2 == 3 -> "Nor this"
  1+1 == 2 -> "But this will"
end
IO.puts(ans)
IO.puts("it's similar to if/else in many imperative languages")
IO.puts("the else is when neither clause is true")
ans=cond do
  2+2 == 5 -> "Not appear"
  2*2 == 6 -> "Not appear"
  #this is the else
  true -> "neighter clause is true" 
end
IO.puts(ans)

#if and unless
IO.puts("If(true) and Unless(false) for only one condition")
if_ans=if true do
  "This works!"
end

unless_ans=unless true do
  "This will never be seen"
end

IO.puts("if_ans -> #{if_ans}")
IO.puts("unlesss_ans -> #{unless_ans}")
IO.puts("support else blocks: ")
if_with_else=
  if nil do
    "this won't be seen"
  else
    "this will"
  end

IO.puts("if_with_else -> #{if_with_else}")

#Scoping
IO.puts("Scoping")
IO.puts("If any variable is declared or changed inside if, case, and similar constructs, the declaration and change will only be visible inside the construct")
x=1
IO.puts("before the if that add 1 to x... x = 1 -> #{x}")
if true do
  x=x+1
end
IO.puts("after the if that add 1 to x... x = ? -> #{x}")
