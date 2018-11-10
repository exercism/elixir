if !System.get_env("EXERCISM_TEST_EXAMPLES") do
  Code.load_file("binary_search.exs", __DIR__)
end

ExUnit.start()
ExUnit.configure(exclude: :pending, trace: true)

defmodule BinarySearchTest do
  use ExUnit.Case

  def box_tuple(tuple) do
    tuple
    |> Tuple.to_list()
    |> Enum.reduce({}, fn (elem, acc) ->
      Tuple.append(acc, fn ->
        Process.put(:search_hit, Process.get(:search_hit, 0) + 1)
        elem
      end)
    end)
  end

  def assert_search_is_binary(expected_hit_number) do
    real_number = Process.get(:search_hit, 0)
    Process.put(:search_hit, 0)

    case real_number == expected_hit_number do
      true ->
        real_number

      false ->
        raise ExUnit.AssertionError,
          message:
            "Your search is not binary: expected #{expected_hit_number} of compares, got #{
              real_number
            }"
    end
  end

  test "returns :not_found on empty tuple" do
    assert BinarySearch.search(box_tuple({}), 2) == :not_found
    assert_search_is_binary(0)
  end

  @tag :pending
  test "returns :not_found when key is not in the tuple" do
    assert BinarySearch.search(box_tuple({2, 4, 6}), 3) == :not_found
    assert_search_is_binary(2)
  end

  @tag :pending
  test "returns :not_found when key is too high" do
    assert BinarySearch.search(box_tuple({2, 4, 6}), 9) == :not_found
    assert_search_is_binary(2)
  end

  @tag :pending
  test "finds key in a tuple with a single item" do
    assert BinarySearch.search(box_tuple({3}), 3) == {:ok, 0}
    assert_search_is_binary(1)
  end

  @tag :pending
  test "finds key when it is the first element in tuple" do
    assert BinarySearch.search(box_tuple({1, 2, 4, 5, 6}), 1) == {:ok, 0}
    assert_search_is_binary(2)
  end

  @tag :pending
  test "finds key when it is in the middle of the tuple" do
    assert BinarySearch.search(box_tuple({1, 2, 4, 5, 6}), 4) == {:ok, 2}
    assert_search_is_binary(1)
  end

  @tag :pending
  test "finds key when it is the last element in tuple" do
    assert BinarySearch.search(box_tuple({1, 2, 4, 5, 6}), 6) == {:ok, 4}
    assert_search_is_binary(3)
  end

  @tag :pending
  test "finds key in a tuple with an even number of elements" do
    tuple = box_tuple({1, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377})
    assert BinarySearch.search(tuple, 21) == {:ok, 5}
    assert_search_is_binary(1)
    assert BinarySearch.search(tuple, 34) == {:ok, 6}
    assert_search_is_binary(3)
  end
end
