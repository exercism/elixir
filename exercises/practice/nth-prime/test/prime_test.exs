defmodule PrimeTest do
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
  @tag :slow
  test "big prime" do
    assert Prime.nth(10001) == 104_743
  end

  @tag :pending
  test "there is no zeroth prime" do
    catch_error(Prime.nth(0))
  end
end
