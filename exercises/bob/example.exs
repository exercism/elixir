defmodule Bob do
  @doc """
  Answers to `hey` like a teenager.

  ## Examples

  iex> Bob.hey("")
  "Fine. Be that way!"

  iex> Bob.hey("Do you like math?")
  "Sure."

  iex> Bob.hey("HELLO!")
  "Whoa, chill out!"

  iex> Bob.hey("Coding is cool.")
  "Whatever."
  """

  def hey(input) do
    cond do
      silent?(input) -> "Fine. Be that way!"
      shouting_question?(input) -> "Calm down, I know what I'm doing!"
      question?(input) -> "Sure."
      shouting?(input) -> "Whoa, chill out!"
      true -> "Whatever."
    end
  end

  defp silent?(input), do: "" == String.trim(input)
  defp shouting?(input), do: input == String.upcase(input) && letters?(input)
  defp question?(input), do: String.ends_with?(input, "?")
  defp shouting_question?(input), do: shouting?(input) && question?(input)
  defp letters?(input), do: Regex.match?(~r/\p{L}+/, input)
end

# Another approach which abstracts knowing about string categories
# away from Bob and into a single responsibility module.
# (This has been commented out to avoid raising a needless "redefinition"
# warning)

# defmodule Message do
#   def silent?(input),            do: "" == String.strip(input)
#   def shouting_question?(input), do: shouting?(input) && question?(input)
#   def shouting?(input),          do: input == String.upcase(input) && letters?(input)
#   def question?(input),          do: String.ends_with?(input, "?")
#   defp letters?(input),          do: Regex.match?(~r/\p{L}+/, input)
# end
#
# defmodule Bob do
#   import Message, only: [silent?: 1, shouting_question?: 1, shouting?: 1, question?: 1]
#
#   def hey(input) do
#     cond do
#       silent?(input)            -> "Fine. Be that way!"
#       shouting_question?(input) -> "Calm down, I know what I'm doing!"
#       shouting?(input)          -> "Whoa, chill out!"
#       question?(input)          -> "Sure."
#       true                      -> "Whatever."
#     end
#   end
# end
