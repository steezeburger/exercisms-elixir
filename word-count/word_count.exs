defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do
    sentence
    |> snake_to_regular_case()
    |> strip_punctuation()
    |> String.split()
    |> Enum.map(&String.downcase/1)
    |> Enum.reduce(%{}, &update_count/2)
  end

  @spec strip_punctuation(String.t()) :: String.t()
  def strip_punctuation(word) do
    String.replace(word, ~r/[^a-zA-Z0-9Ά-ωΑ-ώ\s-]/, "")
  end

  @spec snake_to_regular_case(String.t()) :: String.t()
  def snake_to_regular_case(word) do
    String.replace(word, ~r/_/, " ")
  end

  @spec update_count(String.t(), map) :: map
  def update_count(word, accumulator) do
    Map.update(accumulator, word, 1, &(&1 + 1))
  end

end
