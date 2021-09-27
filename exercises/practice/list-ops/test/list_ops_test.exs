defmodule ListOpsTest do
  alias ListOps, as: L

  use ExUnit.Case

  defp odd?(n), do: rem(n, 2) == 1

  describe "count" do
    # @tag :pending
    test "empty list" do
      assert L.count([]) == 0
    end

    @tag :pending
    test "normal list" do
      assert L.count([1, 2, 3, 4]) == 4
    end

    @tag :pending
    @tag :slow
    test "huge list" do
      assert L.count(Enum.to_list(1..1_000_000)) == 1_000_000
    end
  end

  describe "reverse" do
    @tag :pending
    test "empty list" do
      assert L.reverse([]) == []
    end

    @tag :pending
    test "normal list" do
      assert L.reverse([1, 3, 5, 7]) == [7, 5, 3, 1]
    end

    @tag :pending
    test "list of lists is not flattened" do
      assert L.reverse([[1, 2], [3], [], [4, 5, 6]]) == [[4, 5, 6], [], [3], [1, 2]]
    end

    @tag :pending
    @tag :slow
    test "huge list" do
      assert L.reverse(Enum.to_list(1..1_000_000)) == Enum.to_list(1_000_000..1)
    end
  end

  describe "map" do
    @tag :pending
    test "empty list" do
      assert L.map([], &(&1 + 1)) == []
    end

    @tag :pending
    test "normal list" do
      assert L.map([1, 3, 5, 7], &(&1 + 1)) == [2, 4, 6, 8]
    end

    @tag :pending
    @tag :slow
    test "huge list" do
      assert L.map(Enum.to_list(1..1_000_000), &(&1 + 1)) == Enum.to_list(2..1_000_001)
    end
  end

  describe "filter" do
    @tag :pending
    test "empty list" do
      assert L.filter([], &odd?/1) == []
    end

    @tag :pending
    test "normal list" do
      assert L.filter([1, 2, 3, 5], &odd?/1) == [1, 3, 5]
    end

    @tag :pending
    @tag :slow
    test "huge list" do
      assert L.filter(Enum.to_list(1..1_000_000), &odd?/1) == Enum.map(1..500_000, &(&1 * 2 - 1))
    end

    @tag :pending
    test "truthy values filter the list" do
      assert L.filter([true, false, nil, 0, 1, ""], & &1) == [true, 0, 1, ""]
    end
  end

  describe "foldl" do
    @tag :pending
    test "empty list" do
      assert L.foldl([], 2, &(&1 + &2)) == 2
    end

    @tag :pending
    test "direction independent function applied to non-empty list" do
      assert L.foldl([1, 2, 3, 4], 5, &(&1 + &2)) == 15
    end

    @tag :pending
    test "direction dependent function applied to non-empty list" do
      assert L.foldl([1, 2, 3, 4], 24, &(&1 / &2)) == 64
    end

    @tag :pending
    @tag :slow
    test "huge list" do
      assert L.foldl(Enum.to_list(1..1_000_000), 0, &(&1 + &2)) ==
               List.foldl(Enum.to_list(1..1_000_000), 0, &(&1 + &2))
    end
  end

  describe "foldr" do
    @tag :pending
    test "empty list" do
      assert L.foldr([], 2, &(&1 * &2)) == 2
    end

    @tag :pending
    test "direction independent function applied to non-empty list" do
      assert L.foldr([1, 2, 3, 4], 5, &(&1 + &2)) == 15
    end

    @tag :pending
    test "direction dependent function applied to non-empty list" do
      assert L.foldr([1, 2, 3, 4], 24, &(&1 / &2)) == 9
    end

    @tag :pending
    @tag :slow
    test "huge list" do
      assert L.foldr(Enum.to_list(1..1_000_000), 0, &(&1 + &2)) ==
               List.foldr(Enum.to_list(1..1_000_000), 0, &(&1 + &2))
    end
  end

  describe "append" do
    @tag :pending
    test "empty lists" do
      assert L.append([], []) == []
    end

    @tag :pending
    test "empty and non-empty list" do
      assert L.append([], [1, 2, 3, 4]) == [1, 2, 3, 4]
    end

    @tag :pending
    test "non-empty and empty list" do
      assert L.append([1, 2, 3, 4], []) == [1, 2, 3, 4]
    end

    @tag :pending
    test "non-empty lists" do
      assert L.append([1, 2], [3, 4, 5]) == [1, 2, 3, 4, 5]
    end

    @tag :pending
    @tag :slow
    test "huge lists" do
      assert L.append(Enum.to_list(1..1_000_000), Enum.to_list(1_000_001..2_000_000)) ==
               Enum.to_list(1..2_000_000)
    end
  end

  describe "concat" do
    @tag :pending
    test "empty list of lists" do
      assert L.concat([]) == []
    end

    @tag :pending
    test "normal list of lists" do
      assert L.concat([[1, 2], [3], [], [4, 5, 6]]) == [1, 2, 3, 4, 5, 6]
    end

    @tag :pending
    test "list of nested lists" do
      assert L.concat([[[1], [2]], [[3]], [[]], [[4, 5, 6]]]) == [[1], [2], [3], [], [4, 5, 6]]
    end

    @tag :pending
    @tag :slow
    test "huge list of small lists" do
      assert L.concat(Enum.map(1..1_000_000, &[&1])) == Enum.to_list(1..1_000_000)
    end

    @tag :pending
    @tag :slow
    test "small list of huge lists" do
      assert L.concat(Enum.map(0..9, &Enum.to_list((&1 * 100_000 + 1)..((&1 + 1) * 100_000)))) ==
               Enum.to_list(1..1_000_000)
    end
  end
end
