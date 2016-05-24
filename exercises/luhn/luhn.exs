defmodule Luhn do
  @doc """
  Calculates the total checksum of a number
  """
  @spec checksum(String.t()) :: integer
  def checksum(number) do
  end

  @doc """
  Checks if the given number is valid via the luhn formula
  """
  @spec valid?(String.t()) :: boolean
  def valid?(number) do
  end

  @doc """
  Creates a valid number by adding the correct
  checksum digit to the end of the number
  """
  @spec create(String.t()) :: String.t()
  def create(number) do
  end
end
