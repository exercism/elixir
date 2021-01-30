defmodule RunLengthEncoder do
  @spec encode(String.t()) :: String.t()
  def encode(string) do
    Regex.scan(~r/([a-zA-Z\s])\1*/, string)
    |> Enum.map_join(fn [run, c] ->
      times = String.length(run)

      number =
        if times == 1 do
          ""
        else
          times
        end

      "#{number}#{c}"
    end)
  end

  @spec decode(String.t()) :: String.t()
  def decode(string) do
    Regex.scan(~r/(\d*)(.)/, string)
    |> Enum.map_join(fn [_, n, c] ->
      times =
        if n == "" do
          1
        else
          String.to_integer(n)
        end

      String.duplicate(c, times)
    end)
  end
end
