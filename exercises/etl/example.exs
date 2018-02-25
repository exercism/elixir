defmodule ETL do
  @doc """
  Transform an index into an inverted index.

  ## Examples

  iex> ETL.transform(%{"a" => ["ABILITY", "AARDVARK"], "b" => ["BALLAST", "BEAUTY"]])
  %{"ability" => "a","aardvark" =>"a","ballast" =>"b","beauty" =>"b"]
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
