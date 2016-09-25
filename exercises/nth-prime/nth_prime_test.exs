if !System.get_env("EXERCISM_TEST_EXAMPLES") do
  Code.load_file("nth_prime.exs", __DIR__)
end

ExUnit.start
ExUnit.configure trace: true

defmodule NthPrimeTest do
  use ExUnit.Case

  # @tag :skip
  test "first prime" do
    assert Prime.nth(1) == 2
  end

  @tag :skip
  test "second prime" do
    assert Prime.nth(2) == 3
  end

  @tag :skip
  test "sixth prime" do
    assert Prime.nth(6) == 13
  end

  @tag :skip
  test "100th prime" do
    assert Prime.nth(100) == 541
  end

  @tag :skip
  test "weird case" do
    catch_error Prime.nth(0)
  end
end
