defmodule MenschAergereDichNicht do
  def d6 do
    Enum.random(1..6)
  end

  def roll(d6 \\ &d6/0) do
    d6
    |> Stream.repeatedly()
    |> Stream.transform(true, fn roll, acc ->
      if acc do
        {[roll], roll == 6}
      else
        {:halt, false}
      end
    end)
  end
end
