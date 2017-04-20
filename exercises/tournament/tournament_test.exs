if !System.get_env("EXERCISM_TEST_EXAMPLES") do
  Code.load_file("tournament.exs", __DIR__)
end

ExUnit.start
ExUnit.configure trace: true, exclude: :pending

defmodule TournamentTest do
  use ExUnit.Case

  #@tag :pending
  test "typical input" do
    input = [
      "Allegoric Alaskans;Blithering Badgers;win",
      "Devastating Donkeys;Courageous Californians;draw",
      "Devastating Donkeys;Allegoric Alaskans;win",
      "Courageous Californians;Blithering Badgers;loss",
      "Blithering Badgers;Devastating Donkeys;loss",
      "Allegoric Alaskans;Courageous Californians;win"
    ]

    expected = """
    Team                           | MP |  W |  D |  L |  P
    Devastating Donkeys            |  3 |  2 |  1 |  0 |  7
    Allegoric Alaskans             |  3 |  2 |  0 |  1 |  6
    Blithering Badgers             |  3 |  1 |  0 |  2 |  3
    Courageous Californians        |  3 |  0 |  1 |  2 |  1
    """ |> String.trim

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

    expected = """
    Team                           | MP |  W |  D |  L |  P
    Allegoric Alaskans             |  3 |  2 |  0 |  1 |  6
    Blithering Badgers             |  2 |  1 |  1 |  0 |  4
    Courageous Californians        |  2 |  0 |  1 |  1 |  1
    Devastating Donkeys            |  1 |  0 |  0 |  1 |  0
    """ |> String.trim

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

    expected = """
    Team                           | MP |  W |  D |  L |  P
    Allegoric Alaskans             |  3 |  2 |  1 |  0 |  7
    Courageous Californians        |  3 |  2 |  1 |  0 |  7
    Blithering Badgers             |  3 |  0 |  1 |  2 |  1
    Devastating Donkeys            |  3 |  0 |  1 |  2 |  1
    """ |> String.trim

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

    expected = """
    Team                           | MP |  W |  D |  L |  P
    Devastating Donkeys            |  1 |  1 |  0 |  0 |  3
    Blithering Badgers             |  1 |  0 |  0 |  1 |  0
    """ |> String.trim

    assert Tournament.tally(input) == expected
  end
end

