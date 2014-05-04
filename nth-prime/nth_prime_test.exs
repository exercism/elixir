if System.get_env("EXERCISM_TEST_EXAMPLES") do
  Code.load_file("example.exs")
else
  Code.load_file("nth_prime.exs")
end

ExUnit.start

defmodule NthPrimeTest do
  use ExUnit.Case, async: true

  test "first prime" do
    assert Prime.nth(1) == 2
  end

  test "second prime" do
    assert Prime.nth(2) == 3
  end

  test "sixth prime" do
    assert Prime.nth(6) == 13
  end

  test "100th prime" do
    assert Prime.nth(100) == 541
  end

  test "weird case" do
    catch_error Prime.nth(0)
  end

end
