defmodule NthPrimeTest do
  use ExUnit.Case

  # @tag :pending
  test "first prime" do
    assert Prime.nth(1) == 2
  end

  @tag :pending
  test "second prime" do
    assert Prime.nth(2) == 3
  end

  @tag :pending
  test "sixth prime" do
    assert Prime.nth(6) == 13
  end

  @tag :pending
  test "100th prime" do
    assert Prime.nth(100) == 541
  end

  @tag :pending
  test "weird case" do
    catch_error(Prime.nth(0))
  end
end
