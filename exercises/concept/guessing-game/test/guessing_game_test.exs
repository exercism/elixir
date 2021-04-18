defmodule GuessingGameTest do
  use ExUnit.Case

  test "correct when the guessed number equals secret" do
    assert GuessingGame.compare(7, 7) == "Correct"
  end

  test "too high when guessed number is greater than the secret" do
    assert GuessingGame.compare(9, 18) == "Too High"
  end

  test "too low when guessed number is less than the secret" do
    assert GuessingGame.compare(42, 30) == "Too Low"
  end

  test "so close when guess differs from 7 secret by -1" do
    assert GuessingGame.compare(64, 63) == "So close"
  end

  test "so close when guess differs from 7 secret by +1" do
    assert GuessingGame.compare(52, 53) == "So close"
  end

  test "when no guess is supplied, ask the player to make a guess" do
    assert GuessingGame.compare(15) == "Make a guess"
  end

  test "when the atom :no_guess is supplied, ask the player to make a guess" do
    assert GuessingGame.compare(16, :no_guess) == "Make a guess"
  end
end
