defmodule DominoesTest do
  use ExUnit.Case

  test "empty input = empty output" do
    assert Dominoes.chain?([]) == true
  end

  @tag :pending
  test "singleton input = singleton output" do
    assert Dominoes.chain?([{1, 1}]) == true
  end

  @tag :pending
  test "singleton that can't be chained" do
    assert Dominoes.chain?([{1, 2}]) == false
  end

  @tag :pending
  test "three elements" do
    assert Dominoes.chain?([{1, 2}, {3, 1}, {2, 3}]) == true
  end

  @tag :pending
  test "can reverse dominoes" do
    assert Dominoes.chain?([{1, 2}, {1, 3}, {2, 3}]) == true
  end

  @tag :pending
  test "can't be chained" do
    assert Dominoes.chain?([{1, 2}, {4, 1}, {2, 3}]) == false
  end

  @tag :pending
  test "disconnected - double loop" do
    assert Dominoes.chain?([{1, 2}, {2, 1}, {3, 4}, {4, 3}]) == false
  end

  @tag :pending
  test "disconnected - single isolated" do
    assert Dominoes.chain?([{1, 2}, {2, 3}, {3, 1}, {4, 4}]) == false
  end

  @tag :pending
  test "need backtrack" do
    # a variation in which we have to turn but no duplicates
    assert Dominoes.chain?([{1, 2}, {2, 3}, {3, 1}, {2, 4}, {2, 4}]) == true
  end

  @tag :pending
  test "separate loops" do
    assert Dominoes.chain?([{1, 2}, {2, 3}, {3, 1}, {1, 1}, {2, 2}, {3, 3}]) == true
  end

  @tag :pending
  test "nine elements" do
    assert Dominoes.chain?([
             {1, 2},
             {5, 3},
             {3, 1},
             {1, 2},
             {2, 4},
             {1, 6},
             {2, 3},
             {3, 4},
             {5, 6}
           ]) == true
  end

  @tag :pending
  test "disconnected - simple" do
    refute Dominoes.chain?([{1, 1}, {2, 2}])
  end

  @tag :pending
  test "first and last not matching" do
    assert Dominoes.chain?([{1, 2}, {2, 3}, {3, 4}]) == false
  end

  @tag :pending
  test "wrong starting order" do
    assert Dominoes.chain?([{2, 1}, {2, 3}, {3, 1}]) == true
  end
end
