defmodule Acronym do
  @spec abbreviate(String.t()) :: String.t()
  def abbreviate(string) do
    Regex.scan(~r/[A-Z]+[a-z']*|[a-z][a-z']*/, string)
    |> List.flatten()
    |> Enum.map_join(&String.first/1)
    |> String.upcase()
  end
end
