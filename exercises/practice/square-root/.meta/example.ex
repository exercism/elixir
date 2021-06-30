defmodule SquareRoot do
  @doc """
  Calculate the integer square root of a positive integer
  """
  @spec sqrt(radicand :: pos_integer) :: pos_integer
  def sqrt(1), do: 1

  def sqrt(radicand) do
    guess = div(radicand, 2)
    sqrt(radicand, guess)
  end

  def sqrt(radicand, guess) do
    new_guess = div(guess + div(radicand, guess), 2)

    if new_guess == guess do
      guess
    else
      sqrt(radicand, new_guess)
    end
  end
end
