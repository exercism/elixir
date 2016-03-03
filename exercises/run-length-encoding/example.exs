defmodule RunLengthEncoder do

  @spec encode(String.t) :: String.t
  def encode(string) do
    Regex.scan(~r/([A-Z])\1*/, string)
    |> Enum.map_join(fn([run, c]) -> "#{String.length(run)}#{c}" end)
  end

  @spec decode(String.t) :: String.t
  def decode(string) do
    Regex.scan(~r/(\d+)(.)/, string)
    |> Enum.map_join(fn [_,n,c] -> String.duplicate(c, String.to_integer(n)) end)
  end
end
