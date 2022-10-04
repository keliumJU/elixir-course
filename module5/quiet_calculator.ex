defmodule QuietCalculator do
  @spec add(number,number) :: number
  def add(x,y), do: make_quiet(LousyCalculator.add(x,y))

  @spec make_quiet(LousyCalculator.number_with_remark) :: number
  defp make_quiet({num, _remark}), do: num
end
