defmodule GoCountingTest do
  use ExUnit.Case

  # @tag :pending
  test "Black corner territory on 5x5 board" do
    board = """
    __B__
    _B_B_
    B_W_B
    _W_W_
    __W__
    """

    x = 0
    y = 1
    output = GoCounting.territory(board, {x, y})
    expected = {:ok, %{owner: :black, territory: [{0, 0}, {0, 1}, {1, 0}]}}

    assert output == expected
  end

  @tag :pending
  test "White center territory on 5x5 board" do
    board = """
    __B__
    _B_B_
    B_W_B
    _W_W_
    __W__
    """

    x = 2
    y = 3
    output = GoCounting.territory(board, {x, y})
    expected = {:ok, %{owner: :white, territory: [{2, 3}]}}

    assert output == expected
  end

  @tag :pending
  test "Open corner territory on 5x5 board" do
    board = """
    __B__
    _B_B_
    B_W_B
    _W_W_
    __W__
    """

    x = 1
    y = 4
    output = GoCounting.territory(board, {x, y})
    expected = {:ok, %{owner: :none, territory: [{0, 3}, {0, 4}, {1, 4}]}}

    assert output == expected
  end

  @tag :pending
  test "A stone and not a territory on 5x5 board" do
    board = """
    __B__
    _B_B_
    B_W_B
    _W_W_
    __W__
    """

    x = 1
    y = 1
    output = GoCounting.territory(board, {x, y})
    expected = {:ok, %{owner: :none, territory: []}}

    assert output == expected
  end

  @tag :pending
  test "Invalid because X is too low for 5x5 board" do
    board = """
    __B__
    _B_B_
    B_W_B
    _W_W_
    __W__
    """

    x = -1
    y = 1
    output = GoCounting.territory(board, {x, y})
    expected = {:error, "Invalid coordinate"}

    assert output == expected
  end

  @tag :pending
  test "Invalid because X is too high for 5x5 board" do
    board = """
    __B__
    _B_B_
    B_W_B
    _W_W_
    __W__
    """

    x = 5
    y = 1
    output = GoCounting.territory(board, {x, y})
    expected = {:error, "Invalid coordinate"}

    assert output == expected
  end

  @tag :pending
  test "Invalid because Y is too low for 5x5 board" do
    board = """
    __B__
    _B_B_
    B_W_B
    _W_W_
    __W__
    """

    x = 1
    y = -1
    output = GoCounting.territory(board, {x, y})
    expected = {:error, "Invalid coordinate"}

    assert output == expected
  end

  @tag :pending
  test "Invalid because Y is too high for 5x5 board" do
    board = """
    __B__
    _B_B_
    B_W_B
    _W_W_
    __W__
    """

    x = 1
    y = 5
    output = GoCounting.territory(board, {x, y})
    expected = {:error, "Invalid coordinate"}

    assert output == expected
  end

  @tag :pending
  test "One territory is the whole board" do
    board = "_"
    output = GoCounting.territories(board)

    expected = %{black: [], none: [{0, 0}], white: []}

    assert output == expected
  end

  @tag :pending
  test "Two territory rectangular board" do
    board = """
    _BW_
    _BW_
    """

    output = GoCounting.territories(board)

    expected = %{
      black: [{0, 0}, {0, 1}],
      none: [],
      white: [{3, 0}, {3, 1}]
    }

    assert output == expected
  end

  @tag :pending
  test "Two region rectangular board" do
    board = "_B_"
    output = GoCounting.territories(board)

    expected = %{black: [{0, 0}, {2, 0}], none: [], white: []}

    assert output == expected
  end
end
