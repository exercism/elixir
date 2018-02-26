defmodule Acronym do
  @spec abbreviate(String.t()) :: String.t()
  def abbreviate(string) do
    Regex.scan(~r/[A-Z]+[a-z]*|[a-z]+/, string)
    |> List.flatten()
    |> Enum.map(fn x -> String.first(x) end)
    |> Enum.join("")
    |> String.upcase()
  end
end
