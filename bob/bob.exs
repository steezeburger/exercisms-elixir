defmodule Bob do
  def hey(input) do
    cond do
      isWhiteSpace?(input) -> "Fine. Be that way!"
      isQuestioning?(input) -> "Sure."
      isIntenselyQuestioning?(input) -> "Calm down, I know what I'm doing!"
      isShouting?(input) -> "Whoa, chill out!"
      true -> "Whatever."
    end
  end

  # ^\s*$ All white space.
  def isWhiteSpace?(input) do
    Regex.match?(~r/^\s*$/, input)
  end

  # Capital letters of any language
  def isShouting?(input) do
    Regex.match?(~r/\p{Lu}{2,}/u, input)
  end

  # ^[A-Z]? Might start with a capital letter like a normal question.
  # [^A-Z]* No more capital letters.
  # \?$     Ends in question mark.
  def isQuestioning?(input) do
    Regex.match?(~r/^[A-Z]?[^A-Z]*\?$/, input)
  end

  # ^.* Can start with anything.
  # [A-Z]{2,} Has at least 2 capital letters in succession. This would fail for "$H0UT1N?"
  # .*\?$ Ends in anything then a question mark
  def isIntenselyQuestioning?(input) do
    Regex.match?(~r/^[A-Z]{2,}.*\?$/, input)
  end

end
