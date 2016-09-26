if !System.get_env("EXERCISM_TEST_EXAMPLES") do
  Code.load_file("prime_factors.exs", __DIR__)
end

ExUnit.start
ExUnit.configure trace: true

defmodule PrimeFactorsTest do
  use ExUnit.Case

  # @tag :skip
  test "1" do
    assert PrimeFactors.factors_for(1) == []
  end

  @tag :skip
  test "2" do
    assert PrimeFactors.factors_for(2) == [2]
  end

  @tag :skip
  test "3" do
    assert PrimeFactors.factors_for(3) == [3]
  end

  @tag :skip
  test "4" do
    assert PrimeFactors.factors_for(4) == [2, 2]
  end

  @tag :skip
  test "6" do
    assert PrimeFactors.factors_for(6) == [2, 3]
  end

  @tag :skip
  test "8" do
    assert PrimeFactors.factors_for(8) == [2, 2, 2]
  end

  @tag :skip
  test "9" do
    assert PrimeFactors.factors_for(9) == [3, 3]
  end

  @tag :skip
  test "27" do
    assert PrimeFactors.factors_for(27) == [3, 3, 3]
  end

  @tag :skip
  test "625" do
    assert PrimeFactors.factors_for(625) == [5, 5, 5, 5]
  end

  @tag :skip
  test "901255" do
    assert PrimeFactors.factors_for(901255) == [5, 17, 23, 461]
  end

  @tag :skip
  test "93819012551" do
    assert PrimeFactors.factors_for(93819012551) == [11, 9539, 894119]
  end

  @tag :skip
  # @tag timeout: 2000
  #
  # The timeout tag above will set the below test to fail unless it completes
  # in under two sconds. Uncomment it if you want to test the efficiency of your
  # solution.
  test "10000000055" do
    assert PrimeFactors.factors_for(10000000055) == [5, 2000000011]
  end
end
