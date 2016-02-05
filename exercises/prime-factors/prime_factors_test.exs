if System.get_env("EXERCISM_TEST_EXAMPLES") do
  Code.load_file("example.exs")
else
  Code.load_file("prime_factors.exs")
end

ExUnit.start
ExUnit.configure exclude: :pending, trace: true

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
  test "27" do
    assert PrimeFactors.factors_for(27) == [3, 3, 3]
  end

  @tag :pending
  test "625" do
    assert PrimeFactors.factors_for(625) == [5, 5, 5, 5]
  end

  @tag :pending
  test "901255" do
    assert PrimeFactors.factors_for(901255) == [5, 17, 23, 461]
  end

  @tag :pending
  test "93819012551" do
    assert PrimeFactors.factors_for(93819012551) == [11, 9539, 894119]
  end
end
