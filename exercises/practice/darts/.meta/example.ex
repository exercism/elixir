defmodule Darts do
  @type position :: {float, float}

  @doc """
  Calculate the score of a single dart hitting a target
  """
  @spec score(position :: position) :: integer
  def score({x, y}) do
    radius = :math.sqrt(x * x + y * y)

    cond do
      radius > 10 -> 0
      radius > 5 -> 1
      radius > 1 -> 5
      true -> 10
    end
  end
end
