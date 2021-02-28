defmodule ETL do
  @doc """
  Transforms an old Scrabble score system to a new one.

  ## Examples

    iex> ETL.transform(%{1 => ["A", "E"], 2 => ["D", "G"]})
    %{"a" => 1, "d" => 2, "e" => 1, "g" => 2}
  """
  def transform(input) do
    input
    |> Map.to_list()
    |> invert
    |> List.flatten()
    |> Enum.into(%{})
  end

  defp invert(pairs) do
    Enum.map(pairs, fn {key, values} ->
      Enum.map(values, fn value -> {String.downcase(value), key} end)
    end)
  end
end
