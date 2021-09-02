defmodule DartsTest do
  use ExUnit.Case

  # @tag task_id: 1
  test "Missed target" do
    assert Darts.score({-9, 9}) == 0
  end

  @tag task_id: 2
  test "On the outer circle" do
    assert Darts.score({0, 10}) == 1
  end

  @tag task_id: 3
  test "On the middle circle" do
    assert Darts.score({-5, 0}) == 5
  end

  @tag task_id: 4
  test "On the inner circle" do
    assert Darts.score({0, -1}) == 10
  end

  @tag task_id: 5
  test "Exactly on centre" do
    assert Darts.score({0, 0}) == 10
  end

  @tag task_id: 6
  test "Near the centre" do
    assert Darts.score({-0.1, -0.1}) == 10
  end

  @tag task_id: 7
  test "Just within the inner circle" do
    assert Darts.score({0.7, 0.7}) == 10
  end

  @tag task_id: 8
  test "Just outside the inner circle" do
    assert Darts.score({0.8, -0.8}) == 5
  end

  @tag task_id: 9
  test "Just within the middle circle" do
    assert Darts.score({-3.5, 3.5}) == 5
  end

  @tag task_id: 10
  test "Just outside the middle circle" do
    assert Darts.score({-3.6, -3.6}) == 1
  end

  @tag task_id: 11
  test "Just within the outer circle" do
    assert Darts.score({-7.0, 7.0}) == 1
  end

  @tag task_id: 12
  test "Just outside the outer circle" do
    assert Darts.score({7.1, -7.1}) == 0
  end

  @tag task_id: 13
  test "Asymmetric position between the inner and middle circles" do
    assert Darts.score({0.5, -4}) == 5
  end
end
