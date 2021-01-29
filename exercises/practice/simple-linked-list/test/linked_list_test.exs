defmodule LinkedListTest do
  use ExUnit.Case

  test "length/1 of new list" do
    list = LinkedList.new()
    assert LinkedList.length(list) == 0
  end

  @tag :pending
  test "empty?/1 of new list" do
    list = LinkedList.new()
    assert LinkedList.empty?(list)
  end

  @tag :pending
  test "length/1 of list of 1 datum" do
    list = LinkedList.new() |> LinkedList.push(10)
    assert LinkedList.length(list) == 1
  end

  @tag :pending
  test "empty?/1 of list of 1 datum" do
    list = LinkedList.new() |> LinkedList.push(20)
    refute LinkedList.empty?(list)
  end

  @tag :pending
  test "peek/1 of list of 1 datum" do
    list = LinkedList.new() |> LinkedList.push(20)
    assert LinkedList.peek(list) == {:ok, 20}
  end

  @tag :pending
  test "peek/1 of list of empty list" do
    list = LinkedList.new()
    assert LinkedList.peek(list) == {:error, :empty_list}
  end

  @tag :pending
  test "tail/1 of empty list" do
    list = LinkedList.new()
    assert {:error, :empty_list} = LinkedList.tail(list)
  end

  @tag :pending
  test "tail/1 of list of 1 datum" do
    list = LinkedList.new() |> LinkedList.push(:hello)
    assert {:ok, tail} = LinkedList.tail(list)
    assert LinkedList.peek(tail) == {:error, :empty_list}
  end

  @tag :pending
  test "pushed items are stacked" do
    list =
      LinkedList.new()
      |> LinkedList.push(:a)
      |> LinkedList.push(:b)

    assert LinkedList.peek(list) == {:ok, :b}
    assert {:ok, list} = LinkedList.tail(list)
    assert LinkedList.peek(list) == {:ok, :a}
    assert {:ok, list} = LinkedList.tail(list)
    assert LinkedList.peek(list) == {:error, :empty_list}
  end

  @tag :pending
  test "push 10 times" do
    list = Enum.reduce(1..10, LinkedList.new(), &LinkedList.push(&2, &1))
    assert LinkedList.peek(list) == {:ok, 10}
    assert LinkedList.length(list) == 10
  end

  @tag :pending
  test "pop/1 of list of 1 datum" do
    list = LinkedList.new() |> LinkedList.push(:a)
    assert {:ok, :a, tail} = LinkedList.pop(list)
    assert LinkedList.length(tail) == 0
  end

  @tag :pending
  test "popping frenzy" do
    list = Enum.reduce(11..20, LinkedList.new(), &LinkedList.push(&2, &1))
    assert LinkedList.length(list) == 10
    assert {:ok, 20, list} = LinkedList.pop(list)
    assert {:ok, 19, list} = LinkedList.pop(list)
    assert {:ok, 18, list} = LinkedList.pop(list)
    assert {:ok, 17, list} = LinkedList.pop(list)
    assert {:ok, 16, list} = LinkedList.pop(list)
    assert {:ok, 15} = LinkedList.peek(list)
    assert LinkedList.length(list) == 5
  end

  @tag :pending
  test "from_list/1 of empty list" do
    list = LinkedList.from_list([])
    assert LinkedList.length(list) == 0
  end

  @tag :pending
  test "from_list/1 of 2 element list" do
    list = LinkedList.from_list([:a, :b])
    assert LinkedList.length(list) == 2
    assert {:ok, :a, list} = LinkedList.pop(list)
    assert {:ok, :b, list} = LinkedList.pop(list)
    assert {:error, :empty_list} = LinkedList.pop(list)
  end

  @tag :pending
  test "to_list/1 of empty list" do
    list = LinkedList.new()
    assert LinkedList.to_list(list) == []
  end

  @tag :pending
  test "to_list/1 of list of 1 datum" do
    list = LinkedList.from_list([:mon])
    assert LinkedList.to_list(list) == [:mon]
  end

  @tag :pending
  test "to_list/1 of list of 2 datum" do
    list = LinkedList.from_list([:mon, :tues])
    assert LinkedList.to_list(list) == [:mon, :tues]
  end

  @tag :pending
  test "reverse/1 of list of 2 datum" do
    list = LinkedList.from_list([1, 2, 3]) |> LinkedList.reverse()
    assert LinkedList.to_list(list) == [3, 2, 1]
  end

  @tag :pending
  test "reverse/1 of list of 200 datum" do
    list = Enum.to_list(1..200)
    linked_list = LinkedList.from_list(list) |> LinkedList.reverse()
    assert LinkedList.to_list(linked_list) == Enum.reverse(list)
  end

  @tag :pending
  test "reverse/1 round trip" do
    list = Enum.to_list(1..200)

    linked_list =
      LinkedList.from_list(list)
      |> LinkedList.reverse()
      |> LinkedList.reverse()

    assert LinkedList.to_list(linked_list) == list
  end
end
