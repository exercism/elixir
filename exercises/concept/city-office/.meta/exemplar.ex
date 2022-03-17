defmodule Form do
  @moduledoc """
  A collection of loosely related functions helpful for filling out various forms at the city office.
  """

  @type address_map() :: %{street: String.t(), postal_code: String.t(), city: String.t()}
  @type address_tuple() :: {street :: String.t(), postal_code :: String.t(), city :: String.t()}
  @type address() :: address_map() | address_tuple()

  @doc """
  Generates a string of a given length.

  This string can be used to fill out a form field that is supposed to have no value.
  Such fields cannot be left empty because a malicious third party could fill them out with false data.
  """
  @spec blanks(non_neg_integer()) :: String.t()
  def blanks(n) do
    String.duplicate("X", n)
  end

  @doc """
  Splits the string into a list of uppercase letters.

  This is needed for form fields that don't offer a single input for the whole string,
  but instead require splitting the string into a predefined number of single-letter inputs.
  """
  @spec letters(String.t()) :: list(String.t())
  def letters(word) do
    word
    |> String.upcase()
    |> String.split("", trim: true)
  end

  @doc """
  Checks if the value has no more than the maximum allowed number of letters.

  This is needed to check that the values of fields do not exceed the maximum allowed length.
  It also tells you by how much the value exceeds the maximum.

  ## Examples

      iex> Form.check_length("hello", 5)
      :ok

      iex> Form.check_length("hello", 3)
      {:error, 2}
  """
  @spec check_length(String.t(), non_neg_integer()) :: :ok | {:error, pos_integer()}
  def check_length(word, length) do
    diff = String.length(word) - length

    if diff <= 0 do
      :ok
    else
      {:error, diff}
    end
  end

  @doc """
  Formats the address as an uppercase multiline string.
  """
  @spec format_address(address()) :: String.t()
  def format_address(%{street: street, postal_code: postal_code, city: city}) do
    format_address({street, postal_code, city})
  end

  def format_address({street, postal_code, city}) do
    """
    #{String.upcase(street)}
    #{String.upcase(postal_code)} #{String.upcase(city)}
    """
  end
end
