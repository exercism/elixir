defmodule Proverb do
  @doc """
  Generate a proverb from a list of strings.
  """
  @spec recite(strings :: [String.t()]) :: String.t()
  def recite([]), do: ""

  def recite([thing]),
    do: """
    And all for the want of a #{thing}.
    """

  def recite([thing | rest] = strings) do
    lines =
      Enum.zip(strings, rest)
      |> Enum.map(fn {a, b} -> "For want of a #{a} the #{b} was lost." end)
      |> Enum.join("\n")

    """
    #{lines}
    And all for the want of a #{thing}.
    """
  end
end
