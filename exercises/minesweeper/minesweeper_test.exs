if !System.get_env("EXERCISM_TEST_EXAMPLES") do
  Code.load_file("minesweeper.exs", __DIR__)
end

ExUnit.start
ExUnit.configure trace: true

defmodule MinesweeperTest do
  use ExUnit.Case

  defp clean(b), do: Enum.map(b, &String.replace(&1, ~r/[^*]/, " "))

  # @tag :skip
  test "zero size board" do
    b = []
    assert Minesweeper.annotate(clean(b)) == b
  end

  @tag :skip
  test "empty board" do
    b = ["   ",
         "   ",
         "   "]
    assert Minesweeper.annotate(clean(b)) == b
  end

  @tag :skip
  test "board full of mines" do
    b = ["***",
         "***",
         "***"]
    assert Minesweeper.annotate(clean(b)) == b
  end

  @tag :skip
  test "surrounded" do
    b = ["***",
         "*8*",
         "***"]
    assert Minesweeper.annotate(clean(b)) == b
  end

  @tag :skip
  test "horizontal line" do
    b = ["1*2*1"]
    assert Minesweeper.annotate(clean(b)) == b
  end

  @tag :skip
  test "vertical line" do
    b = ["1",
         "*",
         "2",
         "*",
         "1"]
    assert Minesweeper.annotate(clean(b)) == b
  end

  @tag :skip
  test "cross" do
    b = [" 2*2 ",
         "25*52",
         "*****",
         "25*52",
         " 2*2 "]
    assert Minesweeper.annotate(clean(b)) == b
  end
end
