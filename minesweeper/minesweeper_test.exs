if System.get_env("EXERCISM_TEST_EXAMPLES") do
  Code.load_file("example.exs")
else
  Code.load_file("minesweeper.exs")
end

ExUnit.start

defmodule MinesweeperTest do
  use ExUnit.Case, async: true

  defp clean(b), do: Enum.map(b, &String.replace(&1, ~r/[^*]/, " "))

  test "zero size board" do
    b = []
    assert Minesweeper.annotate(clean(b)) == b
  end

  test "empty board" do
    b = ["   ",
         "   ",
         "   "]
    assert Minesweeper.annotate(clean(b)) == b
  end

  test "board full of mines" do
    b = ["***",
         "***",
         "***"]
    assert Minesweeper.annotate(clean(b)) == b
  end

  test "surrounded" do
    b = ["***",
         "*8*",
         "***"]
    assert Minesweeper.annotate(clean(b)) == b
  end

  test "horizontal line" do
    b = ["1*2*1"]
    assert Minesweeper.annotate(clean(b)) == b
  end

  test "vertical line" do
    b = ["1",
         "*",
         "2",
         "*",
         "1"]
    assert Minesweeper.annotate(clean(b)) == b
  end

  test "cross" do
    b = [" 2*2 ",
         "25*52",
         "*****",
         "25*52",
         " 2*2 "]
    assert Minesweeper.annotate(clean(b)) == b
  end        
end
