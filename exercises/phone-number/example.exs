defmodule Phone do
  @moduledoc """
  Utilities to work with phone numbers.
  """

  @doc """
  Clean up a phone number.

  Returns 0000000000 if the phone number is bad.
  """
  @spec number(String.t) :: String.t
  def number(raw) do
    raw
    |> to_parts
    |> to_string
  end

  @spec to_parts(String.t) :: [String.t]
  defp to_parts(raw) do
    Regex.run(~r/^\D*?1?\D*?(\d{3})\D*(\d{3})\D*(\d{4})$/, raw, [capture: :all_but_first]) || ["000", "000", "0000"]
  end

  @doc """
  Get the area code of a phone number.

  The area code is the first three digits of a cleaned up phone number.
  """
  @spec area_code(String.t) :: String.t
  def area_code(str) do
    str
    |> to_parts
    |> List.first
  end

  @spec prefix(String.t) :: String.t
  def prefix(str) do
    str
    |> to_parts
    |> Enum.at(1)
  end

  @spec line(String.t) :: String.t
  def line(str) do
    str
    |> to_parts
    |> List.last
  end

  @doc """
  Pretty print a phone number.
  """
  @spec pretty(String.t) :: String.t
  def pretty(str) do
    "(#{area_code(str)}) #{prefix(str)}-#{line(str)}"
  end
end
