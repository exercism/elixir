if System.get_env("EXERCISM_TEST_EXAMPLES") do
  Code.load_file("example.exs")
else
  Code.load_file("sum_of_multiples.exs")
end

ExUnit.start

defmodule SumOfMultiplesTest do
  use ExUnit.Case, async: true

  test "sum to 1" do
    assert SumOfMultiples.to(1) == 0
  end

  test "sum to 3" do
    assert SumOfMultiples.to(4) == 3
  end

  test "sum to 10" do
    assert SumOfMultiples.to(10) == 23
  end

  test "sum to 1000" do
    assert SumOfMultiples.to(1000) == 233168
  end

  test "configurable 7, 13, 17 to 20" do
    multiples = [7, 13, 17]
    assert SumOfMultiples.to(20, multiples) == 51
  end

  test "configurable 43, 47 to 10000" do
    multiples = [43, 47]
    assert SumOfMultiples.to(10000, multiples) == 2203160
  end

end
