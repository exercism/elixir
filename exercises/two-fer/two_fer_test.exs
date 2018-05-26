if !System.get_env("EXERCISM_TEST_EXAMPLES") do
  Code.load_file("two_fer.exs", __DIR__)
end

ExUnit.start()
ExUnit.configure(exclude: :pending, trace: true)

defmodule TwoFerTest do
  use ExUnit.Case

  @error_message "Invalid argument, expected a string as argument!"

  test "no name given" do
    assert TwoFer.two_fer() == "One for you, one for me"
  end

  @tag :pending
  test "a name given" do
    assert TwoFer.two_fer("Gilberto Barros") == "One for Gilberto Barros, one for me"
  end

  @tag :pending
  test "when the parameter is a number" do
    assert_raise ArgumentError, @error_message, fn ->
      TwoFer.two_fer(10)
    end
  end

  @tag :pending
  test "when the parameter is an atom" do
    assert_raise ArgumentError, @error_message, fn ->
      TwoFer.two_fer(:bob)
    end
  end

  @tag :pending
  test "when the parameter is a charlist" do
    assert_raise ArgumentError, @error_message, fn ->
      refute TwoFer.two_fer('Jon Snow')
    end
  end
end
