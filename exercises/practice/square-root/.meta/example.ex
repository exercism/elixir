defmodule SquareRoot do
  @doc """
  Calculate the integer square root of a positive integer
  """
  @spec square_root(radicand :: pos_integer) :: pos_integer
  def square_root(1), do: 1

  def square_root(radicand) do
    guess = div(radicand, 2)
    square_root(radicand, guess)
  end

  def square_root(radicand, guess) do
    new_guess = div(guess + div(radicand, guess), 2)

    if new_guess == guess do
      guess
    else
      square_root(radicand, new_guess)
    end
  end
end
