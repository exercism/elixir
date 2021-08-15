defmodule PrimeFactorsTest do
  use ExUnit.Case

  # @tag :pending
  test "1" do
    assert PrimeFactors.factors_for(1) == []
  end

  @tag :pending
  test "2" do
    assert PrimeFactors.factors_for(2) == [2]
  end

  @tag :pending
  test "3" do
    assert PrimeFactors.factors_for(3) == [3]
  end

  @tag :pending
  test "4" do
    assert PrimeFactors.factors_for(4) == [2, 2]
  end

  @tag :pending
  test "6" do
    assert PrimeFactors.factors_for(6) == [2, 3]
  end

  @tag :pending
  test "8" do
    assert PrimeFactors.factors_for(8) == [2, 2, 2]
  end

  @tag :pending
  test "9" do
    assert PrimeFactors.factors_for(9) == [3, 3]
  end

  @tag :pending
  test "12" do
    assert PrimeFactors.factors_for(12) == [2, 2, 3]
  end

  @tag :pending
  test "27" do
    assert PrimeFactors.factors_for(27) == [3, 3, 3]
  end

  @tag :pending
  test "625" do
    assert PrimeFactors.factors_for(625) == [5, 5, 5, 5]
  end

  @tag :pending
  test "901255" do
    assert PrimeFactors.factors_for(901_255) == [5, 17, 23, 461]
  end

  @tag :pending
  test "93819012551" do
    assert PrimeFactors.factors_for(93_819_012_551) == [11, 9539, 894_119]
  end

  @tag :pending
  @tag :slow
  # @tag timeout: 2000
  #
  # The timeout tag above will set the below test to fail unless it completes
  # in under two seconds. Uncomment it if you want to test the efficiency of your
  # solution.
  test "10000000055" do
    assert PrimeFactors.factors_for(10_000_000_055) == [5, 2_000_000_011]
  end
end
