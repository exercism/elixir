defmodule GuessingGame do
  def compare(secret_number, guess \\ :no_guess)

  def compare(secret_number, guess) when guess == :no_guess do
    "Make a guess"
  end

  def compare(secret_number, guess) when guess == secret_number do
    "Correct"
  end

  def compare(secret_number, guess)
      when guess == secret_number + 1
      or guess == secret_number - 1 do
    "So close"
  end

  def compare(secret_number, guess) when guess > secret_number do
    "Too High"
  end

  def compare(secret_number, guess) when guess < secret_number do
    "Too Low"
  end
end
