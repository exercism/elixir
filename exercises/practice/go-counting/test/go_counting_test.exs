defmodule GoCountingTest do
  use ExUnit.Case

  def equal?({:error, err}, {:error, err}), do: assert(true)

  def equal?({:ok, %{owner: owner, territory: t1}}, {:ok, %{owner: owner, territory: t2}}),
    do: assert(Enum.sort(t1) == Enum.sort(t2))

  def equal?(%{black: b1, none: n1, white: w1}, %{black: b2, none: n2, white: w2}) do
    assert Enum.sort(b1) == Enum.sort(b2)
    assert Enum.sort(n1) == Enum.sort(n2)
    assert Enum.sort(w1) == Enum.sort(w2)
  end

  def equal?(_a, _b), do: flunk("Unexpected output")

  # @tag :pending
  test "Black corner territory on 5x5 board" do
    board = ["  B  ", " B B ", "B W B", " W W ", "  W  "]
    x = 0
    y = 1
    output = GoCounting.territory(board, {x, y})
    expected = {:ok, %{owner: :black, territory: [{0, 0}, {0, 1}, {1, 0}]}}

    equal?(output, expected)
  end

  @tag :pending
  test "White center territory on 5x5 board" do
    board = ["  B  ", " B B ", "B W B", " W W ", "  W  "]
    x = 2
    y = 3
    output = GoCounting.territory(board, {x, y})
    expected = {:ok, %{owner: :white, territory: [{2, 3}]}}

    equal?(output, expected)
  end

  @tag :pending
  test "Open corner territory on 5x5 board" do
    board = ["  B  ", " B B ", "B W B", " W W ", "  W  "]
    x = 1
    y = 4
    output = GoCounting.territory(board, {x, y})
    expected = {:ok, %{owner: :none, territory: [{0, 3}, {0, 4}, {1, 4}]}}

    equal?(output, expected)
  end

  @tag :pending
  test "A stone and not a territory on 5x5 board" do
    board = ["  B  ", " B B ", "B W B", " W W ", "  W  "]
    x = 1
    y = 1
    output = GoCounting.territory(board, {x, y})
    expected = {:ok, %{owner: :none, territory: []}}

    equal?(output, expected)
  end

  @tag :pending
  test "Invalid because X is too low for 5x5 board" do
    board = ["  B  ", " B B ", "B W B", " W W ", "  W  "]
    x = -1
    y = 1
    output = GoCounting.territory(board, {x, y})
    expected = {:error, "Invalid coordinate"}

    equal?(output, expected)
  end

  @tag :pending
  test "Invalid because X is too high for 5x5 board" do
    board = ["  B  ", " B B ", "B W B", " W W ", "  W  "]
    x = 5
    y = 1
    output = GoCounting.territory(board, {x, y})
    expected = {:error, "Invalid coordinate"}

    equal?(output, expected)
  end

  @tag :pending
  test "Invalid because Y is too low for 5x5 board" do
    board = ["  B  ", " B B ", "B W B", " W W ", "  W  "]
    x = 1
    y = -1
    output = GoCounting.territory(board, {x, y})
    expected = {:error, "Invalid coordinate"}

    equal?(output, expected)
  end

  @tag :pending
  test "Invalid because Y is too high for 5x5 board" do
    board = ["  B  ", " B B ", "B W B", " W W ", "  W  "]
    x = 1
    y = 5
    output = GoCounting.territory(board, {x, y})
    expected = {:error, "Invalid coordinate"}

    equal?(output, expected)
  end

  @tag :pending
  test "One territory is the whole board" do
    board = [" "]
    output = GoCounting.territories(board)

    expected = %{black: [], none: [{0, 0}], white: []}

    equal?(output, expected)
  end

  @tag :pending
  test "Two territory rectangular board" do
    board = [" BW ", " BW "]
    output = GoCounting.territories(board)

    expected = %{
      black: [{0, 0}, {0, 1}],
      none: [],
      white: [{3, 0}, {3, 1}]
    }

    equal?(output, expected)
  end

  @tag :pending
  test "Two region rectangular board" do
    board = [" B "]
    output = GoCounting.territories(board)

    expected = %{black: [{0, 0}, {2, 0}], none: [], white: []}

    equal?(output, expected)
  end
end
