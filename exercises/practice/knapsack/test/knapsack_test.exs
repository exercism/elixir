defmodule KnapsackTest do
  use ExUnit.Case

  # @tag :pending
  test "no items" do
    items = []
    maximum_weight = 100

    assert Knapsack.maximum_value(items, maximum_weight) == 0
  end

  @tag :pending
  test "one item, too heavy" do
    items = [%{value: 1, weight: 100}]
    maximum_weight = 10

    assert Knapsack.maximum_value(items, maximum_weight) == 0
  end

  @tag :pending
  test "five items (cannot be greedy by weight)" do
    items = [
      %{value: 5, weight: 2},
      %{value: 5, weight: 2},
      %{value: 5, weight: 2},
      %{value: 5, weight: 2},
      %{value: 21, weight: 10}
    ]

    maximum_weight = 10

    assert Knapsack.maximum_value(items, maximum_weight) == 21
  end

  @tag :pending
  test "five items (cannot be greedy by value)" do
    items = [
      %{value: 20, weight: 2},
      %{value: 20, weight: 2},
      %{value: 20, weight: 2},
      %{value: 20, weight: 2},
      %{value: 50, weight: 10}
    ]

    maximum_weight = 10

    assert Knapsack.maximum_value(items, maximum_weight) == 80
  end

  @tag :pending
  test "example knapsack" do
    items = [
      %{value: 10, weight: 5},
      %{value: 40, weight: 4},
      %{value: 30, weight: 6},
      %{value: 50, weight: 4}
    ]

    maximum_weight = 10

    assert Knapsack.maximum_value(items, maximum_weight) == 90
  end

  @tag :pending
  test "8 items" do
    items = [
      %{value: 350, weight: 25},
      %{value: 400, weight: 35},
      %{value: 450, weight: 45},
      %{value: 20, weight: 5},
      %{value: 70, weight: 25},
      %{value: 8, weight: 3},
      %{value: 5, weight: 2},
      %{value: 5, weight: 2}
    ]

    maximum_weight = 104

    assert Knapsack.maximum_value(items, maximum_weight) == 900
  end

  @tag :pending
  test "15 items" do
    items = [
      %{value: 135, weight: 70},
      %{value: 139, weight: 73},
      %{value: 149, weight: 77},
      %{value: 150, weight: 80},
      %{value: 156, weight: 82},
      %{value: 163, weight: 87},
      %{value: 173, weight: 90},
      %{value: 184, weight: 94},
      %{value: 192, weight: 98},
      %{value: 201, weight: 106},
      %{value: 210, weight: 110},
      %{value: 214, weight: 113},
      %{value: 221, weight: 115},
      %{value: 229, weight: 118},
      %{value: 240, weight: 120}
    ]

    maximum_weight = 750

    assert Knapsack.maximum_value(items, maximum_weight) == 1458
  end
end
