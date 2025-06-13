defmodule JigsawPuzzleTest do
  use ExUnit.Case

  # @tag :pending
  test "1000 pieces puzzle with 1.6 aspect ratio" do
    incomplete_puzzle = %JigsawPuzzle{
      pieces: 1000,
      aspect_ratio: 1.6
    }

    expected =
      %JigsawPuzzle{
        pieces: 1000,
        rows: 25,
        columns: 40,
        format: :landscape,
        aspect_ratio: 1.6,
        border: 126,
        inside: 874
      }

    assert JigsawPuzzle.data(incomplete_puzzle) == {:ok, expected}
  end

  @tag :pending
  test "square puzzle with 32 rows" do
    incomplete_puzzle = %JigsawPuzzle{
      format: :square,
      rows: 32
    }

    expected =
      %JigsawPuzzle{
        pieces: 1024,
        rows: 32,
        columns: 32,
        format: :square,
        aspect_ratio: 1.0,
        border: 124,
        inside: 900
      }

    assert JigsawPuzzle.data(incomplete_puzzle) == {:ok, expected}
  end

  @tag :pending
  test "400 pieces square puzzle with only inside pieces and aspect ratio" do
    incomplete_puzzle = %JigsawPuzzle{
      aspect_ratio: 1.0,
      inside: 324
    }

    expected =
      %JigsawPuzzle{
        pieces: 400,
        rows: 20,
        columns: 20,
        format: :square,
        aspect_ratio: 1.0,
        border: 76,
        inside: 324
      }

    assert JigsawPuzzle.data(incomplete_puzzle) == {:ok, expected}
  end

  @tag :pending
  test "1500 pieces landscape puzzle with 30 rows and 1.6 aspect ratio" do
    incomplete_puzzle = %JigsawPuzzle{
      aspect_ratio: 5 / 3,
      rows: 30
    }

    expected =
      %JigsawPuzzle{
        pieces: 1500,
        rows: 30,
        columns: 50,
        format: :landscape,
        aspect_ratio: 5 / 3,
        border: 156,
        inside: 1344
      }

    assert JigsawPuzzle.data(incomplete_puzzle) == {:ok, expected}
  end

  @tag :pending
  test "300 pieces portrait puzzle with 70 border pieces" do
    incomplete_puzzle = %JigsawPuzzle{
      border: 70,
      format: :portrait,
      pieces: 300
    }

    expected =
      %JigsawPuzzle{
        pieces: 300,
        rows: 25,
        columns: 12,
        format: :portrait,
        aspect_ratio: 0.48,
        border: 70,
        inside: 230
      }

    assert JigsawPuzzle.data(incomplete_puzzle) == {:ok, expected}
  end

  @tag :pending
  test "puzzle with insufficient data" do
    incomplete_puzzle = %JigsawPuzzle{
      format: :landscape,
      pieces: 1500
    }

    assert JigsawPuzzle.data(incomplete_puzzle) == {:error, "Insufficient data"}
  end

  @tag :pending
  test "puzzle with contradictory data" do
    incomplete_puzzle = %JigsawPuzzle{
      columns: 1000,
      format: :square,
      rows: 100
    }

    assert JigsawPuzzle.data(incomplete_puzzle) == {:error, "Contradictory data"}
  end
end
