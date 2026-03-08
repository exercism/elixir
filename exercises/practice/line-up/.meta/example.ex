defmodule LineUp do
  @doc """
  Formats an ordinal numeral for a given name and number.
  """
  @spec format(name :: String.t(), number :: pos_integer()) :: String.t()
  def format(name, number) do
    suffix =
      cond do
        rem(number, 100) in [11, 12, 13] -> "th"
        rem(number, 10) == 1 -> "st"
        rem(number, 10) == 2 -> "nd"
        rem(number, 10) == 3 -> "rd"
        true -> "th"
      end

    "#{name}, you are the #{number}#{suffix} customer we serve today. Thank you!"
  end
end
