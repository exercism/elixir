defmodule CamiciaTest do
  use ExUnit.Case

  # @tag :pending
  test "two cards, one trick" do
    playerA = ["2"]
    playerB = ["3"]
    expected = {:finished, 2, 1}
    assert Camicia.simulate(playerA, playerB) == expected
  end

  @tag :pending
  test "three cards, one trick" do
    playerA = ["2", "4"]
    playerB = ["3"]
    expected = {:finished, 3, 1}
    assert Camicia.simulate(playerA, playerB) == expected
  end

  @tag :pending
  test "four cards, one trick" do
    playerA = ["2", "4"]
    playerB = ["3", "5", "6"]
    expected = {:finished, 4, 1}
    assert Camicia.simulate(playerA, playerB) == expected
  end

  @tag :pending
  test "the ace reigns supreme" do
    playerA = ["2", "A"]
    playerB = ["3", "4", "5", "6", "7"]
    expected = {:finished, 7, 1}
    assert Camicia.simulate(playerA, playerB) == expected
  end

  @tag :pending
  test "the king beats ace" do
    playerA = ["2", "A"]
    playerB = ["3", "4", "5", "6", "K"]
    expected = {:finished, 7, 1}
    assert Camicia.simulate(playerA, playerB) == expected
  end

  @tag :pending
  test "jack beats king" do
    playerA = ["2", "A", "7", "8", "Q"]
    playerB = ["3", "4", "5", "6", "K"]
    expected = {:finished, 10, 1}
    assert Camicia.simulate(playerA, playerB) == expected
  end

  @tag :pending
  test "the jack betrays the queen" do
    playerA = ["2", "A", "7", "8", "Q"]
    playerB = ["3", "4", "5", "6", "K", "9", "J"]
    expected = {:finished, 12, 1}
    assert Camicia.simulate(playerA, playerB) == expected
  end

  @tag :pending
  test "the 10 just wants to put on a show" do
    playerA = ["2", "A", "7", "8", "Q", "10"]
    playerB = ["3", "4", "5", "6", "K", "9", "J"]
    expected = {:finished, 13, 1}
    assert Camicia.simulate(playerA, playerB) == expected
  end

  @tag :pending
  test "simple loop with decks of 3 cards" do
    playerA = ["J", "2", "3"]
    playerB = ["4", "J", "5"]
    expected = {:loop, 8, 3}
    assert Camicia.simulate(playerA, playerB) == expected
  end

  @tag :pending
  test "the story is starting to get a bit complicated" do
    playerA = [
      "2",
      "6",
      "6",
      "J",
      "4",
      "K",
      "Q",
      "10",
      "K",
      "J",
      "Q",
      "2",
      "3",
      "K",
      "5",
      "6",
      "Q",
      "Q",
      "A",
      "A",
      "6",
      "9",
      "K",
      "A",
      "8",
      "K",
      "2",
      "A",
      "9",
      "A",
      "Q",
      "4",
      "K",
      "K",
      "K",
      "3",
      "5",
      "K",
      "8",
      "Q",
      "3",
      "Q",
      "7",
      "J",
      "K",
      "J",
      "9",
      "J",
      "3",
      "3",
      "K",
      "K",
      "Q",
      "A",
      "K",
      "7",
      "10",
      "A",
      "Q",
      "7",
      "10",
      "J",
      "4",
      "5",
      "J",
      "9",
      "10",
      "Q",
      "J",
      "J",
      "K",
      "6",
      "10",
      "J",
      "6",
      "Q",
      "J",
      "5",
      "J",
      "Q",
      "Q",
      "8",
      "3",
      "8",
      "A",
      "2",
      "6",
      "9",
      "K",
      "7",
      "J",
      "K",
      "K",
      "8",
      "K",
      "Q",
      "6",
      "10",
      "J",
      "10",
      "J",
      "Q",
      "J",
      "10",
      "3",
      "8",
      "K",
      "A",
      "6",
      "9",
      "K",
      "2",
      "A",
      "A",
      "10",
      "J",
      "6",
      "A",
      "4",
      "J",
      "A",
      "J",
      "J",
      "6",
      "2",
      "J",
      "3",
      "K",
      "2",
      "5",
      "9",
      "J",
      "9",
      "6",
      "K",
      "A",
      "5",
      "Q",
      "J",
      "2",
      "Q",
      "K",
      "A",
      "3",
      "K",
      "J",
      "K",
      "2",
      "5",
      "6",
      "Q",
      "J",
      "Q",
      "Q",
      "J",
      "2",
      "J",
      "9",
      "Q",
      "7",
      "7",
      "A",
      "Q",
      "7",
      "Q",
      "J",
      "K",
      "J",
      "A",
      "7",
      "7",
      "8",
      "Q",
      "10",
      "J",
      "10",
      "J",
      "J",
      "9",
      "2",
      "A",
      "2"
    ]

    playerB = [
      "7",
      "2",
      "10",
      "K",
      "8",
      "2",
      "J",
      "9",
      "A",
      "5",
      "6",
      "J",
      "Q",
      "6",
      "K",
      "6",
      "5",
      "A",
      "4",
      "Q",
      "7",
      "J",
      "7",
      "10",
      "2",
      "Q",
      "8",
      "2",
      "2",
      "K",
      "J",
      "A",
      "5",
      "5",
      "A",
      "4",
      "Q",
      "6",
      "Q",
      "K",
      "10",
      "8",
      "Q",
      "2",
      "10",
      "J",
      "A",
      "Q",
      "8",
      "Q",
      "Q",
      "J",
      "J",
      "A",
      "A",
      "9",
      "10",
      "J",
      "K",
      "4",
      "Q",
      "10",
      "10",
      "J",
      "K",
      "10",
      "2",
      "J",
      "7",
      "A",
      "K",
      "K",
      "J",
      "A",
      "J",
      "10",
      "8",
      "K",
      "A",
      "7",
      "Q",
      "Q",
      "J",
      "3",
      "Q",
      "4",
      "A",
      "3",
      "A",
      "Q",
      "Q",
      "Q",
      "5",
      "4",
      "K",
      "J",
      "10",
      "A",
      "Q",
      "J",
      "6",
      "J",
      "A",
      "10",
      "A",
      "5",
      "8",
      "3",
      "K",
      "5",
      "9",
      "Q",
      "8",
      "7",
      "7",
      "J",
      "7",
      "Q",
      "Q",
      "Q",
      "A",
      "7",
      "8",
      "9",
      "A",
      "Q",
      "A",
      "K",
      "8",
      "A",
      "A",
      "J",
      "8",
      "4",
      "8",
      "K",
      "J",
      "A",
      "10",
      "Q",
      "8",
      "J",
      "8",
      "6",
      "10",
      "Q",
      "J",
      "J",
      "A",
      "A",
      "J",
      "5",
      "Q",
      "6",
      "J",
      "K",
      "Q",
      "8",
      "K",
      "4",
      "Q",
      "Q",
      "6",
      "J",
      "K",
      "4",
      "7",
      "J",
      "J",
      "9",
      "9",
      "A",
      "Q",
      "Q",
      "K",
      "A",
      "6",
      "5",
      "K"
    ]

    expected = {:finished, 361, 1}
    assert Camicia.simulate(playerA, playerB) == expected
  end

  @tag :pending
  test "two tricks" do
    playerA = ["J"]
    playerB = ["3", "J"]
    expected = {:finished, 5, 2}
    assert Camicia.simulate(playerA, playerB) == expected
  end

  @tag :pending
  test "more tricks" do
    playerA = ["J", "2", "4"]
    playerB = ["3", "J", "A"]
    expected = {:finished, 12, 4}
    assert Camicia.simulate(playerA, playerB) == expected
  end

  @tag :pending
  test "simple loop with decks of 4 cards" do
    playerA = ["2", "3", "J", "6"]
    playerB = ["K", "5", "J", "7"]
    expected = {:loop, 16, 4}
    assert Camicia.simulate(playerA, playerB) == expected
  end

  @tag :pending
  test "easy card combination" do
    playerA = [
      "4",
      "8",
      "7",
      "5",
      "4",
      "10",
      "3",
      "9",
      "7",
      "3",
      "10",
      "10",
      "6",
      "8",
      "2",
      "8",
      "5",
      "4",
      "5",
      "9",
      "6",
      "5",
      "2",
      "8",
      "10",
      "9"
    ]

    playerB = [
      "6",
      "9",
      "4",
      "7",
      "2",
      "2",
      "3",
      "6",
      "7",
      "3",
      "A",
      "A",
      "A",
      "A",
      "K",
      "K",
      "K",
      "K",
      "Q",
      "Q",
      "Q",
      "Q",
      "J",
      "J",
      "J",
      "J"
    ]

    expected = {:finished, 40, 4}
    assert Camicia.simulate(playerA, playerB) == expected
  end

  @tag :pending
  test "easy card combination, inverted decks" do
    playerA = [
      "3",
      "3",
      "5",
      "7",
      "3",
      "2",
      "10",
      "7",
      "6",
      "7",
      "A",
      "A",
      "A",
      "A",
      "K",
      "K",
      "K",
      "K",
      "Q",
      "Q",
      "Q",
      "Q",
      "J",
      "J",
      "J",
      "J"
    ]

    playerB = [
      "5",
      "10",
      "8",
      "2",
      "6",
      "7",
      "2",
      "4",
      "9",
      "2",
      "6",
      "10",
      "10",
      "5",
      "4",
      "8",
      "4",
      "8",
      "6",
      "9",
      "8",
      "5",
      "9",
      "3",
      "4",
      "9"
    ]

    expected = {:finished, 40, 4}
    assert Camicia.simulate(playerA, playerB) == expected
  end

  @tag :pending
  test "mirrored decks" do
    playerA = [
      "2",
      "A",
      "3",
      "A",
      "3",
      "K",
      "4",
      "K",
      "2",
      "Q",
      "2",
      "Q",
      "10",
      "J",
      "5",
      "J",
      "6",
      "10",
      "2",
      "9",
      "10",
      "7",
      "3",
      "9",
      "6",
      "9"
    ]

    playerB = [
      "6",
      "A",
      "4",
      "A",
      "7",
      "K",
      "4",
      "K",
      "7",
      "Q",
      "7",
      "Q",
      "5",
      "J",
      "8",
      "J",
      "4",
      "5",
      "8",
      "9",
      "10",
      "6",
      "8",
      "3",
      "8",
      "5"
    ]

    expected = {:finished, 59, 4}
    assert Camicia.simulate(playerA, playerB) == expected
  end

  @tag :pending
  test "opposite decks" do
    playerA = [
      "4",
      "A",
      "9",
      "A",
      "4",
      "K",
      "9",
      "K",
      "6",
      "Q",
      "8",
      "Q",
      "8",
      "J",
      "10",
      "J",
      "9",
      "8",
      "4",
      "6",
      "3",
      "6",
      "5",
      "2",
      "4",
      "3"
    ]

    playerB = [
      "10",
      "7",
      "3",
      "2",
      "9",
      "2",
      "7",
      "8",
      "7",
      "5",
      "J",
      "7",
      "J",
      "10",
      "Q",
      "10",
      "Q",
      "3",
      "K",
      "5",
      "K",
      "6",
      "A",
      "2",
      "A",
      "5"
    ]

    expected = {:finished, 151, 21}
    assert Camicia.simulate(playerA, playerB) == expected
  end

  @tag :pending
  test "random decks #1" do
    playerA = [
      "K",
      "10",
      "9",
      "8",
      "J",
      "8",
      "6",
      "9",
      "7",
      "A",
      "K",
      "5",
      "4",
      "4",
      "J",
      "5",
      "J",
      "4",
      "3",
      "5",
      "8",
      "6",
      "7",
      "7",
      "4",
      "9"
    ]

    playerB = [
      "6",
      "3",
      "K",
      "A",
      "Q",
      "10",
      "A",
      "2",
      "Q",
      "8",
      "2",
      "10",
      "10",
      "2",
      "Q",
      "3",
      "K",
      "9",
      "7",
      "A",
      "3",
      "Q",
      "5",
      "J",
      "2",
      "6"
    ]

    expected = {:finished, 542, 76}
    assert Camicia.simulate(playerA, playerB) == expected
  end

  @tag :pending
  test "random decks #2" do
    playerA = [
      "8",
      "A",
      "4",
      "8",
      "5",
      "Q",
      "J",
      "2",
      "6",
      "2",
      "9",
      "7",
      "K",
      "A",
      "8",
      "10",
      "K",
      "8",
      "10",
      "9",
      "K",
      "6",
      "7",
      "3",
      "K",
      "9"
    ]

    playerB = [
      "10",
      "5",
      "2",
      "6",
      "Q",
      "J",
      "A",
      "9",
      "5",
      "5",
      "3",
      "7",
      "3",
      "J",
      "A",
      "2",
      "Q",
      "3",
      "J",
      "Q",
      "4",
      "10",
      "4",
      "7",
      "4",
      "6"
    ]

    expected = {:finished, 327, 42}
    assert Camicia.simulate(playerA, playerB) == expected
  end

  @tag :pending
  test "Kebler 1999" do
    playerA = [
      "4",
      "8",
      "9",
      "J",
      "Q",
      "8",
      "5",
      "5",
      "K",
      "2",
      "A",
      "9",
      "8",
      "5",
      "10",
      "A",
      "4",
      "J",
      "3",
      "K",
      "6",
      "9",
      "2",
      "Q",
      "K",
      "7"
    ]

    playerB = [
      "10",
      "J",
      "3",
      "2",
      "4",
      "10",
      "4",
      "7",
      "5",
      "3",
      "6",
      "6",
      "7",
      "A",
      "J",
      "Q",
      "A",
      "7",
      "2",
      "10",
      "3",
      "K",
      "9",
      "6",
      "8",
      "Q"
    ]

    expected = {:finished, 5790, 805}
    assert Camicia.simulate(playerA, playerB) == expected
  end

  @tag :pending
  test "Collins 2006" do
    playerA = [
      "A",
      "8",
      "Q",
      "K",
      "9",
      "10",
      "3",
      "7",
      "4",
      "2",
      "Q",
      "3",
      "2",
      "10",
      "9",
      "K",
      "A",
      "8",
      "7",
      "7",
      "4",
      "5",
      "J",
      "9",
      "2",
      "10"
    ]

    playerB = [
      "4",
      "J",
      "A",
      "K",
      "8",
      "5",
      "6",
      "6",
      "A",
      "6",
      "5",
      "Q",
      "4",
      "6",
      "10",
      "8",
      "J",
      "2",
      "5",
      "7",
      "Q",
      "J",
      "3",
      "3",
      "K",
      "9"
    ]

    expected = {:finished, 6913, 960}
    assert Camicia.simulate(playerA, playerB) == expected
  end

  @tag :pending
  test "Mann and Wu 2007" do
    playerA = [
      "K",
      "2",
      "K",
      "K",
      "3",
      "3",
      "6",
      "10",
      "K",
      "6",
      "A",
      "2",
      "5",
      "5",
      "7",
      "9",
      "J",
      "A",
      "A",
      "3",
      "4",
      "Q",
      "4",
      "8",
      "J",
      "6"
    ]

    playerB = [
      "4",
      "5",
      "2",
      "Q",
      "7",
      "9",
      "9",
      "Q",
      "7",
      "J",
      "9",
      "8",
      "10",
      "3",
      "10",
      "J",
      "4",
      "10",
      "8",
      "6",
      "8",
      "7",
      "A",
      "Q",
      "5",
      "2"
    ]

    expected = {:finished, 7157, 1007}
    assert Camicia.simulate(playerA, playerB) == expected
  end

  @tag :pending
  test "Nessler 2012" do
    playerA = [
      "10",
      "3",
      "6",
      "7",
      "Q",
      "2",
      "9",
      "8",
      "2",
      "8",
      "4",
      "A",
      "10",
      "6",
      "K",
      "2",
      "10",
      "A",
      "5",
      "A",
      "2",
      "4",
      "Q",
      "J",
      "K",
      "4"
    ]

    playerB = [
      "10",
      "Q",
      "4",
      "6",
      "J",
      "9",
      "3",
      "J",
      "9",
      "3",
      "3",
      "Q",
      "K",
      "5",
      "9",
      "5",
      "K",
      "6",
      "5",
      "7",
      "8",
      "J",
      "A",
      "7",
      "8",
      "7"
    ]

    expected = {:finished, 7207, 1015}
    assert Camicia.simulate(playerA, playerB) == expected
  end

  @tag :pending
  test "Anderson 2013" do
    playerA = [
      "6",
      "7",
      "A",
      "3",
      "Q",
      "3",
      "5",
      "J",
      "3",
      "2",
      "J",
      "7",
      "4",
      "5",
      "Q",
      "10",
      "5",
      "A",
      "J",
      "2",
      "K",
      "8",
      "9",
      "9",
      "K",
      "3"
    ]

    playerB = [
      "4",
      "J",
      "6",
      "9",
      "8",
      "5",
      "10",
      "7",
      "9",
      "Q",
      "2",
      "7",
      "10",
      "8",
      "4",
      "10",
      "A",
      "6",
      "4",
      "A",
      "6",
      "8",
      "Q",
      "K",
      "K",
      "2"
    ]

    expected = {:finished, 7225, 1016}
    assert Camicia.simulate(playerA, playerB) == expected
  end

  @tag :pending
  test "Rucklidge 2014" do
    playerA = [
      "8",
      "J",
      "2",
      "9",
      "4",
      "4",
      "5",
      "8",
      "Q",
      "3",
      "9",
      "3",
      "6",
      "2",
      "8",
      "A",
      "A",
      "A",
      "9",
      "4",
      "7",
      "2",
      "5",
      "Q",
      "Q",
      "3"
    ]

    playerB = [
      "K",
      "7",
      "10",
      "6",
      "3",
      "J",
      "A",
      "7",
      "6",
      "5",
      "5",
      "8",
      "10",
      "9",
      "10",
      "4",
      "2",
      "7",
      "K",
      "Q",
      "10",
      "K",
      "6",
      "J",
      "J",
      "K"
    ]

    expected = {:finished, 7959, 1122}
    assert Camicia.simulate(playerA, playerB) == expected
  end

  @tag :pending
  test "Nessler 2021" do
    playerA = [
      "7",
      "2",
      "3",
      "4",
      "K",
      "9",
      "6",
      "10",
      "A",
      "8",
      "9",
      "Q",
      "7",
      "A",
      "4",
      "8",
      "J",
      "J",
      "A",
      "4",
      "3",
      "2",
      "5",
      "6",
      "6",
      "J"
    ]

    playerB = [
      "3",
      "10",
      "8",
      "9",
      "8",
      "K",
      "K",
      "2",
      "5",
      "5",
      "7",
      "6",
      "4",
      "3",
      "5",
      "7",
      "A",
      "9",
      "J",
      "K",
      "2",
      "Q",
      "10",
      "Q",
      "10",
      "Q"
    ]

    expected = {:finished, 7972, 1106}
    assert Camicia.simulate(playerA, playerB) == expected
  end

  @tag :pending
  test "Nessler 2022" do
    playerA = [
      "2",
      "10",
      "10",
      "A",
      "J",
      "3",
      "8",
      "Q",
      "2",
      "5",
      "5",
      "5",
      "9",
      "2",
      "4",
      "3",
      "10",
      "Q",
      "A",
      "K",
      "Q",
      "J",
      "J",
      "9",
      "Q",
      "K"
    ]

    playerB = [
      "10",
      "7",
      "6",
      "3",
      "6",
      "A",
      "8",
      "9",
      "4",
      "3",
      "K",
      "J",
      "6",
      "K",
      "4",
      "9",
      "7",
      "8",
      "5",
      "7",
      "8",
      "2",
      "A",
      "7",
      "4",
      "6"
    ]

    expected = {:finished, 8344, 1164}
    assert Camicia.simulate(playerA, playerB) == expected
  end

  @tag :pending
  test "Casella 2024, first infinite game found" do
    playerA = [
      "2",
      "8",
      "4",
      "K",
      "5",
      "2",
      "3",
      "Q",
      "6",
      "K",
      "Q",
      "A",
      "J",
      "3",
      "5",
      "9",
      "8",
      "3",
      "A",
      "A",
      "J",
      "4",
      "4",
      "J",
      "7",
      "5"
    ]

    playerB = [
      "7",
      "7",
      "8",
      "6",
      "10",
      "10",
      "6",
      "10",
      "7",
      "2",
      "Q",
      "6",
      "3",
      "2",
      "4",
      "K",
      "Q",
      "10",
      "J",
      "5",
      "9",
      "8",
      "9",
      "9",
      "K",
      "A"
    ]

    expected = {:loop, 474, 66}
    assert Camicia.simulate(playerA, playerB) == expected
  end
end
