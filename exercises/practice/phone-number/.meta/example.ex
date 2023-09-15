defmodule PhoneNumber do
  @doc """
  Remove formatting from a phone number if the given number is valid. Return an error otherwise.
  """
  @spec clean(String.t()) :: {:ok, String.t()} | {:error, String.t()}
  def clean(raw) do
    validators = [
      &validate_digits/1,
      &validate_length/1,
      &validate_country_code/1,
      &validate_area_code/1,
      &validate_exchange_code/1
    ]

    Enum.reduce_while(validators, {:ok, remove_separators(raw)}, fn validator, acc ->
      {:ok, number} = acc

      case validator.(number) do
        {:ok, number} -> {:cont, {:ok, number}}
        {:error, error} -> {:halt, {:error, error}}
      end
    end)
  end

  defp remove_separators(number) do
    String.replace(number, ~r/[\s+.()-]/, "")
  end

  defp validate_digits(number) do
    valid_digits? =
      number
      |> String.codepoints()
      |> Enum.all?(fn <<x>> -> x in ?0..?9 end)

    if valid_digits?, do: {:ok, number}, else: {:error, "must contain digits only"}
  end

  defp validate_length(number) do
    length = String.length(number)

    cond do
      length < 10 -> {:error, "must not be fewer than 10 digits"}
      length > 11 -> {:error, "must not be greater than 11 digits"}
      true -> {:ok, number}
    end
  end

  defp validate_country_code(number) do
    case String.length(number) do
      10 ->
        {:ok, number}

      11 ->
        if String.starts_with?(number, "1") do
          {:ok, number |> String.split_at(1) |> elem(1)}
        else
          {:error, "11 digits must start with 1"}
        end
    end
  end

  defp validate_area_code(number) do
    {area_code, _} = String.split_at(number, 3)

    cond do
      String.starts_with?(area_code, "0") -> {:error, "area code cannot start with zero"}
      String.starts_with?(area_code, "1") -> {:error, "area code cannot start with one"}
      true -> {:ok, number}
    end
  end

  defp validate_exchange_code(number) do
    {_area_code, rest} = String.split_at(number, 3)
    {exchange_code, _} = String.split_at(rest, 3)

    cond do
      String.starts_with?(exchange_code, "0") -> {:error, "exchange code cannot start with zero"}
      String.starts_with?(exchange_code, "1") -> {:error, "exchange code cannot start with one"}
      true -> {:ok, number}
    end
  end
end
