defmodule TournamentTest do
  use ExUnit.Case

  # @tag :pending
  test "just the header if no input" do
    input = []

    expected =
      """
      Team                           | MP |  W |  D |  L |  P
      """
      |> String.trim()

    assert Tournament.tally(input) == expected
  end

  @tag :pending
  test "a win is three points, a loss is zero points" do
    input = [
      "Allegoric Alaskans;Blithering Badgers;win"
    ]

    expected =
      """
      Team                           | MP |  W |  D |  L |  P
      Allegoric Alaskans             |  1 |  1 |  0 |  0 |  3
      Blithering Badgers             |  1 |  0 |  0 |  1 |  0
      """
      |> String.trim()

    assert Tournament.tally(input) == expected
  end

  @tag :pending
  test "a win can also be expressed as a loss" do
    input = [
      "Blithering Badgers;Allegoric Alaskans;loss"
    ]

    expected =
      """
      Team                           | MP |  W |  D |  L |  P
      Allegoric Alaskans             |  1 |  1 |  0 |  0 |  3
      Blithering Badgers             |  1 |  0 |  0 |  1 |  0
      """
      |> String.trim()

    assert Tournament.tally(input) == expected
  end

  @tag :pending
  test "a different team can win" do
    input = [
      "Blithering Badgers;Allegoric Alaskans;win"
    ]

    expected =
      """
      Team                           | MP |  W |  D |  L |  P
      Blithering Badgers             |  1 |  1 |  0 |  0 |  3
      Allegoric Alaskans             |  1 |  0 |  0 |  1 |  0
      """
      |> String.trim()

    assert Tournament.tally(input) == expected
  end

  @tag :pending
  test "a draw is one point each" do
    input = [
      "Allegoric Alaskans;Blithering Badgers;draw"
    ]

    expected =
      """
      Team                           | MP |  W |  D |  L |  P
      Allegoric Alaskans             |  1 |  0 |  1 |  0 |  1
      Blithering Badgers             |  1 |  0 |  1 |  0 |  1
      """
      |> String.trim()

    assert Tournament.tally(input) == expected
  end

  @tag :pending
  test "There can be more than one match" do
    input = [
      "Allegoric Alaskans;Blithering Badgers;win",
      "Allegoric Alaskans;Blithering Badgers;win"
    ]

    expected =
      """
      Team                           | MP |  W |  D |  L |  P
      Allegoric Alaskans             |  2 |  2 |  0 |  0 |  6
      Blithering Badgers             |  2 |  0 |  0 |  2 |  0
      """
      |> String.trim()

    assert Tournament.tally(input) == expected
  end

  @tag :pending
  test "There can be more than one winner" do
    input = [
      "Allegoric Alaskans;Blithering Badgers;loss",
      "Allegoric Alaskans;Blithering Badgers;win"
    ]

    expected =
      """
      Team                           | MP |  W |  D |  L |  P
      Allegoric Alaskans             |  2 |  1 |  0 |  1 |  3
      Blithering Badgers             |  2 |  1 |  0 |  1 |  3
      """
      |> String.trim()

    assert Tournament.tally(input) == expected
  end

  @tag :pending
  test "There can be more than two teams" do
    input = [
      "Allegoric Alaskans;Blithering Badgers;win",
      "Blithering Badgers;Courageous Californians;win",
      "Courageous Californians;Allegoric Alaskans;loss"
    ]

    expected =
      """
      Team                           | MP |  W |  D |  L |  P
      Allegoric Alaskans             |  2 |  2 |  0 |  0 |  6
      Blithering Badgers             |  2 |  1 |  0 |  1 |  3
      Courageous Californians        |  2 |  0 |  0 |  2 |  0
      """
      |> String.trim()

    assert Tournament.tally(input) == expected
  end

  @tag :pending
  test "typical input" do
    input = [
      "Allegoric Alaskans;Blithering Badgers;win",
      "Devastating Donkeys;Courageous Californians;draw",
      "Devastating Donkeys;Allegoric Alaskans;win",
      "Courageous Californians;Blithering Badgers;loss",
      "Blithering Badgers;Devastating Donkeys;loss",
      "Allegoric Alaskans;Courageous Californians;win"
    ]

    expected =
      """
      Team                           | MP |  W |  D |  L |  P
      Devastating Donkeys            |  3 |  2 |  1 |  0 |  7
      Allegoric Alaskans             |  3 |  2 |  0 |  1 |  6
      Blithering Badgers             |  3 |  1 |  0 |  2 |  3
      Courageous Californians        |  3 |  0 |  1 |  2 |  1
      """
      |> String.trim()

    assert Tournament.tally(input) == expected
  end

  @tag :pending
  test "incomplete competition (not all pairs have played)" do
    input = [
      "Allegoric Alaskans;Blithering Badgers;loss",
      "Devastating Donkeys;Allegoric Alaskans;loss",
      "Courageous Californians;Blithering Badgers;draw",
      "Allegoric Alaskans;Courageous Californians;win"
    ]

    expected =
      """
      Team                           | MP |  W |  D |  L |  P
      Allegoric Alaskans             |  3 |  2 |  0 |  1 |  6
      Blithering Badgers             |  2 |  1 |  1 |  0 |  4
      Courageous Californians        |  2 |  0 |  1 |  1 |  1
      Devastating Donkeys            |  1 |  0 |  0 |  1 |  0
      """
      |> String.trim()

    assert Tournament.tally(input) == expected
  end

  @tag :pending
  test "ties broken alphabetically" do
    input = [
      "Courageous Californians;Devastating Donkeys;win",
      "Allegoric Alaskans;Blithering Badgers;win",
      "Devastating Donkeys;Allegoric Alaskans;loss",
      "Courageous Californians;Blithering Badgers;win",
      "Blithering Badgers;Devastating Donkeys;draw",
      "Allegoric Alaskans;Courageous Californians;draw"
    ]

    expected =
      """
      Team                           | MP |  W |  D |  L |  P
      Allegoric Alaskans             |  3 |  2 |  1 |  0 |  7
      Courageous Californians        |  3 |  2 |  1 |  0 |  7
      Blithering Badgers             |  3 |  0 |  1 |  2 |  1
      Devastating Donkeys            |  3 |  0 |  1 |  2 |  1
      """
      |> String.trim()

    assert Tournament.tally(input) == expected
  end

  @tag :pending
  test "mostly invalid lines" do
    # Invalid input lines in an otherwise-valid game still results in valid
    # output.
    input = [
      "",
      "Allegoric Alaskans@Blithering Badgers;draw",
      "Blithering Badgers;Devastating Donkeys;loss",
      "Devastating Donkeys;Courageous Californians;win;5",
      "Courageous Californians;Allegoric Alaskans;los"
    ]

    expected =
      """
      Team                           | MP |  W |  D |  L |  P
      Devastating Donkeys            |  1 |  1 |  0 |  0 |  3
      Blithering Badgers             |  1 |  0 |  0 |  1 |  0
      """
      |> String.trim()

    assert Tournament.tally(input) == expected
  end

  @tag :pending
  test "ensure points sorted numerically" do
    input = [
      "Devastating Donkeys;Blithering Badgers;win",
      "Devastating Donkeys;Blithering Badgers;win",
      "Devastating Donkeys;Blithering Badgers;win",
      "Devastating Donkeys;Blithering Badgers;win",
      "Blithering Badgers;Devastating Donkeys;win"
    ]

    expected =
      """
      Team                           | MP |  W |  D |  L |  P
      Devastating Donkeys            |  5 |  4 |  0 |  1 | 12
      Blithering Badgers             |  5 |  1 |  0 |  4 |  3
      """
      |> String.trim()

    assert Tournament.tally(input) == expected
  end
end
