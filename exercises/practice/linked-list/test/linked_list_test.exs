defmodule LinkedListTest do
  use ExUnit.Case

  # @tag :pending
  test "pop gets element from the list" do
    linked =
      LinkedList.new()
      |> LinkedList.push(7)

    {value, _} = LinkedList.pop(linked)
    assert value == 7
  end

  @tag :pending
  test "push/pop respectively add/remove at the end of the list" do
    linked =
      LinkedList.new()
      |> LinkedList.push(11)
      |> LinkedList.push(13)

    {value, linked} = LinkedList.pop(linked)
    assert value == 13
    {value, _} = LinkedList.pop(linked)
    assert value == 11
  end

  @tag :pending
  test "shift gets an element from the list" do
    linked =
      LinkedList.new()
      |> LinkedList.push(17)

    {value, _} = LinkedList.shift(linked)
    assert value == 17
  end

  @tag :pending
  test "shift gets first element from the list" do
    linked =
      LinkedList.new()
      |> LinkedList.push(23)
      |> LinkedList.push(5)

    {value, linked} = LinkedList.shift(linked)
    assert value == 23
    {value, _} = LinkedList.shift(linked)
    assert value == 5
  end

  @tag :pending
  test "unshift adds element at start of the list" do
    linked =
      LinkedList.new()
      |> LinkedList.unshift(23)
      |> LinkedList.unshift(5)

    {value, linked} = LinkedList.shift(linked)
    assert value == 5
    {value, _} = LinkedList.shift(linked)
    assert value == 23
  end

  @tag :pending
  test "pop, push, shift, and unshift can be used in any order" do
    linked =
      LinkedList.new()
      |> LinkedList.push(1)
      |> LinkedList.push(2)

    {value, linked} = LinkedList.pop(linked)
    assert value == 2
    linked = LinkedList.push(linked, 3)
    {value, linked} = LinkedList.shift(linked)
    assert value == 1

    linked =
      LinkedList.unshift(linked, 4)
      |> LinkedList.push(5)

    {value, linked} = LinkedList.shift(linked)
    assert value == 4
    {value, linked} = LinkedList.pop(linked)
    assert value == 5
    {value, _} = LinkedList.shift(linked)
    assert value == 3
  end

  @tag :pending
  test "count an empty list" do
    linked = LinkedList.new()
    assert LinkedList.count(linked) == 0
  end

  @tag :pending
  test "count a list with items" do
    linked =
      LinkedList.new()
      |> LinkedList.push(37)
      |> LinkedList.push(1)

    assert LinkedList.count(linked) == 2
  end

  @tag :pending
  test "count is correct after mutation" do
    linked =
      LinkedList.new()
      |> LinkedList.push(31)

    assert LinkedList.count(linked) == 1
    linked = LinkedList.unshift(linked, 43)
    assert LinkedList.count(linked) == 2
    {_, linked} = LinkedList.shift(linked)
    assert LinkedList.count(linked) == 1
    {_, linked} = LinkedList.pop(linked)
    assert LinkedList.count(linked) == 0
  end

  @tag :pending
  test "popping to empty doesn't break the list" do
    linked =
      LinkedList.new()
      |> LinkedList.push(41)
      |> LinkedList.push(59)

    {_, linked} = LinkedList.pop(linked)
    {_, linked} = LinkedList.pop(linked)
    linked = LinkedList.push(linked, 47)
    assert LinkedList.count(linked) == 1
    {value, _} = LinkedList.pop(linked)
    assert value == 47
  end

  @tag :pending
  test "shifting to empty doesn't break the list" do
    linked =
      LinkedList.new()
      |> LinkedList.push(41)
      |> LinkedList.push(59)

    {_, linked} = LinkedList.shift(linked)
    {_, linked} = LinkedList.shift(linked)
    linked = LinkedList.push(linked, 47)
    assert LinkedList.count(linked) == 1
    {value, _} = LinkedList.shift(linked)
    assert value == 47
  end

  @tag :pending
  test "deletes the only element" do
    linked =
      LinkedList.new()
      |> LinkedList.push(61)
      |> LinkedList.delete(61)

    assert LinkedList.count(linked) == 0
  end

  @tag :pending
  test "deletes the element with the specified value from the list" do
    linked =
      LinkedList.new()
      |> LinkedList.push(71)
      |> LinkedList.push(83)
      |> LinkedList.push(79)
      |> LinkedList.delete(83)

    assert LinkedList.count(linked) == 2
    {value, linked} = LinkedList.pop(linked)
    assert value == 79
    {value, _} = LinkedList.shift(linked)
    assert value == 71
  end

  @tag :pending
  test "deletes the element with the specified value from the list, re-assigns tail" do
    linked =
      LinkedList.new()
      |> LinkedList.push(71)
      |> LinkedList.push(83)
      |> LinkedList.push(79)
      |> LinkedList.delete(83)

    assert LinkedList.count(linked) == 2
    {value, linked} = LinkedList.pop(linked)
    assert value == 79
    {value, _} = LinkedList.pop(linked)
    assert value == 71
  end

  @tag :pending
  test "deletes the element with the specified value from the list, re-assigns head" do
    linked =
      LinkedList.new()
      |> LinkedList.push(71)
      |> LinkedList.push(83)
      |> LinkedList.push(79)
      |> LinkedList.delete(83)

    assert LinkedList.count(linked) == 2
    {value, linked} = LinkedList.shift(linked)
    assert value == 71
    {value, _} = LinkedList.shift(linked)
    assert value == 79
  end

  @tag :pending
  test "deletes the first of two elements" do
    linked =
      LinkedList.new()
      |> LinkedList.push(97)
      |> LinkedList.push(101)
      |> LinkedList.delete(97)

    assert LinkedList.count(linked) == 1
    {value, _} = LinkedList.pop(linked)
    assert value == 101
  end

  @tag :pending
  test "deletes the second of two elements" do
    linked =
      LinkedList.new()
      |> LinkedList.push(97)
      |> LinkedList.push(101)
      |> LinkedList.delete(101)

    assert LinkedList.count(linked) == 1
    {value, _} = LinkedList.pop(linked)
    assert value == 97
  end

  @tag :pending
  test "delete does not modify the list if the element is not found" do
    linked =
      LinkedList.new()
      |> LinkedList.push(89)
      |> LinkedList.delete(103)

    assert LinkedList.count(linked) == 1
  end

  @tag :pending
  test "deletes only the first occurrence" do
    linked =
      LinkedList.new()
      |> LinkedList.push(73)
      |> LinkedList.push(9)
      |> LinkedList.push(9)
      |> LinkedList.push(107)
      |> LinkedList.delete(9)

    assert LinkedList.count(linked) == 3
    {value, linked} = LinkedList.pop(linked)
    assert value == 107
    {value, linked} = LinkedList.pop(linked)
    assert value == 9
    {value, _} = LinkedList.pop(linked)
    assert value == 73
  end
end
