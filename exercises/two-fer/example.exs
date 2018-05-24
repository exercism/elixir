defmodule TwoFer do
  @doc """
    Two-fer or 2-fer is short for two for one. One for you and one for me.
  """
  @spec two_fer :: String.t()
  def two_fer(name \\ "you")
  def two_fer(name) when not is_bitstring(name), do: false
  def two_fer(name), do: "One for #{name}, one for me"
end
