defmodule Acronym do
  @spec abbreviate(String.t()) :: String.t()
  def abbreviate(string) do
    Regex.scan(~r/[A-Z]+[a-z']*|[a-z][a-z']*/, string)
    |> List.flatten()
    |> Enum.map(&String.first/1)
    |> Enum.join()
    |> String.upcase()
  end
end
