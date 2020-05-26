defmodule GuessingGameTest do
  use ExUnit.Case

  # @tag :pending
  test "correct when the guessed number equals secret" do
    assert GuessingGame.compare(7, 7) == "Correct"
  end

  @tag :pending
  test "too high when guessed number is greater than the secret" do
    assert GuessingGame.compare(9, 18) == "Too High"
  end

  @tag :pending
  test "too low when guessed number is less than the secret" do
    assert GuessingGame.compare(42, 30) == "Too Low"
  end

  @tag :pending
  test "so close when guess differs from 7 secret by -1" do
    assert GuessingGame.compare(64, 63) == "So close"
  end

  @tag :pending
  test "so close when guess differs from 7 secret by +1" do
    assert GuessingGame.compare(52,53) == "So close"
  end

  @tag :pending
  test "when no guess is supplied, ask the player to make a guess" do
    assert GuessingGame.compare(15) == "Make a guess"
  end
end
