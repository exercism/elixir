defmodule BookStoreTest do
  use ExUnit.Case

  # @tag :pending
  test "Only a single book" do
    # Suggested grouping, [[1]].
    basket = [1]

    assert BookStore.total(basket) == 800
  end

  @tag :pending
  test "Two of the same book" do
    # Suggested grouping, [[2],[2]].
    basket = [2, 2]

    assert BookStore.total(basket) == 1600
  end

  @tag :pending
  test "Empty basket" do
    # Suggested grouping, [].
    basket = []

    assert BookStore.total(basket) == 0
  end

  @tag :pending
  test "Two different books" do
    # Suggested grouping, [[1,2]].
    basket = [1, 2]

    assert BookStore.total(basket) == 1520
  end

  @tag :pending
  test "Three different books" do
    # Suggested grouping, [[1,2,3]].
    basket = [1, 2, 3]

    assert BookStore.total(basket) == 2160
  end

  @tag :pending
  test "Four different books" do
    # Suggested grouping, [[1,2,3,4]].
    basket = [1, 2, 3, 4]

    assert BookStore.total(basket) == 2560
  end

  @tag :pending
  test "Five different books" do
    # Suggested grouping, [[1,2,3,4,5]].
    basket = [1, 2, 3, 4, 5]

    assert BookStore.total(basket) == 3000
  end

  @tag :pending
  test "Two groups of four is cheaper than group of five plus group of three" do
    # Suggested grouping, [[1,2,3,4],[1,2,3,5]].
    basket = [1, 1, 2, 2, 3, 3, 4, 5]

    assert BookStore.total(basket) == 5120
  end

  @tag :pending
  test "Two groups of four is cheaper than groups of five and three" do
    # Suggested grouping, [[1,2,4,5],[1,3,4,5]]. This differs from the other 'two groups of four' test in that it will fail for solutions that add books to groups in the order in which they appear in the list.
    basket = [1, 1, 2, 3, 4, 4, 5, 5]

    assert BookStore.total(basket) == 5120
  end

  @tag :pending
  test "Group of four plus group of two is cheaper than two groups of three" do
    # Suggested grouping, [[1,2,3,4],[1,2]].
    basket = [1, 1, 2, 2, 3, 4]

    assert BookStore.total(basket) == 4080
  end

  @tag :pending
  test "Two each of first 4 books and 1 copy each of rest" do
    # Suggested grouping, [[1,2,3,4,5],[1,2,3,4]].
    basket = [1, 1, 2, 2, 3, 3, 4, 4, 5]

    assert BookStore.total(basket) == 5560
  end

  @tag :pending
  test "Two copies of each book" do
    # Suggested grouping, [[1,2,3,4,5],[1,2,3,4,5]].
    basket = [1, 1, 2, 2, 3, 3, 4, 4, 5, 5]

    assert BookStore.total(basket) == 6000
  end

  @tag :pending
  test "Three copies of first book and 2 each of remaining" do
    # Suggested grouping, [[1,2,3,4,5],[1,2,3,4,5],[1]].
    basket = [1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 1]

    assert BookStore.total(basket) == 6800
  end

  @tag :pending
  test "Three each of first 2 books and 2 each of remaining books" do
    # Suggested grouping, [[1,2,3,4,5],[1,2,3,4,5],[1,2]].
    basket = [1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 1, 2]

    assert BookStore.total(basket) == 7520
  end

  @tag :pending
  test "Four groups of four are cheaper than two groups each of five and three" do
    # Suggested grouping, [[1,2,3,4],[1,2,3,5],[1,2,3,4],[1,2,3,5]].
    basket = [1, 1, 2, 2, 3, 3, 4, 5, 1, 1, 2, 2, 3, 3, 4, 5]

    assert BookStore.total(basket) == 10240
  end
end
