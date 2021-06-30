defmodule SquareRootTest do
  use ExUnit.Case

  # @tag :pending
  test "root of 1" do
    radicand = 1
    output = SquareRoot.calculate(radicand)
    expected = 1

    assert output == expected
  end

  @tag :pending
  test "root of 4" do
    radicand = 4
    output = SquareRoot.calculate(radicand)
    expected = 2

    assert output == expected
  end

  @tag :pending
  test "root of 25" do
    radicand = 25
    output = SquareRoot.calculate(radicand)
    expected = 5

    assert output == expected
  end

  @tag :pending
  test "root of 81" do
    radicand = 81
    output = SquareRoot.calculate(radicand)
    expected = 9

    assert output == expected
  end

  @tag :pending
  test "root of 196" do
    radicand = 196
    output = SquareRoot.calculate(radicand)
    expected = 14

    assert output == expected
  end

  @tag :pending
  test "root of 65025" do
    radicand = 65025
    output = SquareRoot.calculate(radicand)
    expected = 255

    assert output == expected
  end
end
