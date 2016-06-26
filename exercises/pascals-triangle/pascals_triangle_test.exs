if !System.get_env("EXERCISM_TEST_EXAMPLES") do
  Code.load_file("pascals_triangle.exs")
end


ExUnit.start
ExUnit.configure exclude: :pending, trace: true

defmodule PascalsTriangleTest do
  use ExUnit.Case

  test "test one row" do
    assert [[1]] == PascalsTriangle.rows(1)
  end

  @tag :pending
  test "test two rows" do
    assert [[1], [1, 1]] == PascalsTriangle.rows(2)
  end

  @tag :pending
  test "test three rows" do
    assert [[1], [1, 1], [1, 2, 1]] == PascalsTriangle.rows(3)
  end

  @tag :pending
  test "test fourth row" do
    assert [1, 3, 3, 1] == List.last(PascalsTriangle.rows(4))
  end

  @tag :pending
  test "test fifth row" do
    assert [1, 4, 6, 4, 1] == List.last(PascalsTriangle.rows(5))
  end

  @tag :pending
  test "test twentieth row" do
    expected = [
      1, 19, 171, 969, 3876, 11_628, 27_132, 50_388, 75_582, 92_378, 92_378,
      75_582, 50_388, 27_132, 11_628, 3876, 969, 171, 19, 1
    ]
    assert expected == List.last(PascalsTriangle.rows(20))
  end
end
