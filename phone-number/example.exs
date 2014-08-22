defmodule Phone do
  @moduledoc """
  Utilities to work with phone numbers.
  """

  @bad_result "0000000000"

  @doc """
  Clean up a phone number.

  Returns 0000000000 if the phone number is bad.
  """
  @spec number(String.t) :: String.t
  def number(raw) do
    raw
    |> numeric
    |> String.graphemes
    |> do_number
    |> to_string
  end

  defp numeric(input), do: String.replace(input, ~r/[^0-9]*/, "")

  defp do_number(input) when length(input) == 10, do: input
  defp do_number(["1"|input]) when length(input) == 10, do: input
  defp do_number(_), do: @bad_result

  @doc """
  Get the area code of a phone number.
  
  The area code is the first three digits of a cleaned up phone number.
  """
  @spec area_code(String.t) :: String.t
  def area_code(str) do
    number(str) |> String.slice(0, 3)
  end

  @doc """
  Pretty print a phone number.
  """
  @spec pretty(String.t) :: String.t
  def pretty(str) do
    c = number(str)
    "(#{String.slice(c, 0, 3)}) #{String.slice(c, 3, 3)}-#{String.slice(c,6,4)}"
  end
end
