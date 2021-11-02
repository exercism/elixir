defmodule SquareRoot do
  @doc """
  Calculate the integer square root of a positive integer
  """
  @spec calculate(radicand :: pos_integer) :: pos_integer
  def calculate(1), do: 1

  def calculate(radicand) do
    guess = div(radicand, 2)
    calculate(radicand, guess)
  end

  defp calculate(radicand, guess) do
    new_guess = div(guess + div(radicand, guess), 2)

    if new_guess == guess do
      guess
    else
      calculate(radicand, new_guess)
    end
  end
end
