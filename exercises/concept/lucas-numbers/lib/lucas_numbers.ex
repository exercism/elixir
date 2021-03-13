defmodule LucasNumbers do
  @moduledoc """
  Lucas numbers are an infinite sequence of numbers which build progressively
  which hold a strong correlation to the golden ratio (φ or ϕ)

  E.g.: 2, 1, 3, 4, 7, 11, 18, 29, ...
  """
  def generate(count) when count < 1 do
    raise ArgumentError, "must generate at least 1 number"
  end

  def generate(1) do
    [2]
  end

  def generate(2) do
    [2, 1]
  end

  def generate(count) do
    sequence =
      {2, 1}
      |> Stream.iterate(fn {a, b} -> {b, a + b} end)
      |> Stream.map(&elem(&1, 1))
      |> Stream.take(count - 1)
      |> Enum.to_list()

    [2 | sequence]
  end
end
