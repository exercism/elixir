defmodule Form do
  defmodule Address do
    defstruct [:street, :postal_code, :city]
  end

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

  def format_address(%Address{} = address) do
    format_address({address.street, address.postal_code, address.city})
  end

  def format_address({street, postal_code, city}) do
    """
    #{String.upcase(street)}
    #{String.upcase(postal_code)} #{String.upcase(city)}
    """
  end
end
