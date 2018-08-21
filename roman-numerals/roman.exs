defmodule Roman do
  @doc """
  Convert the number to a roman number.
  """
  @spec numerals(pos_integer) :: String.t()
  def numerals(n) when n >= 1000, do: reduce_characters(n, "M", 1000)
  def numerals(n) when n >= 900,  do: reduce_characters(n, "CM", 900)
  def numerals(n) when n >= 500,  do: reduce_characters(n, "D", 500)
  def numerals(n) when n >= 400,  do: reduce_characters(n, "CD", 400)
  def numerals(n) when n >= 100,  do: reduce_characters(n, "C", 100)
  def numerals(n) when n >= 90,   do: reduce_characters(n, "XC", 90)
  def numerals(n) when n >= 50,   do: reduce_characters(n, "L", 50)
  def numerals(n) when n >= 40,   do: reduce_characters(n, "XL", 40)
  def numerals(n) when n >= 10,   do: reduce_characters(n, "X", 10)
  def numerals(9),                do: "IX"
  def numerals(n) when n >= 5,    do: reduce_characters(n, "V", 5)
  def numerals(4),                do: "IV"
  def numerals(n),                do: String.duplicate("I", n)

  defp reduce_characters(total, character, number) do
    String.duplicate(character, div(total, number)) <> numerals(rem(total, number))
  end
end
