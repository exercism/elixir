defmodule Form do
  def blanks(n) do
    String.duplicate("X", n)
  end

  def letters(word) do
    word
    |> String.upcase()
    |> String.split("", trim: true)
  end

  def check_length(word, length) do
    diff = String.length(word) - length

    if diff <= 0 do
      :ok
    else
      {:error, diff}
    end
  end

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
