defmodule SchoolTest do
  use ExUnit.Case

  @db %{}

  test "add student" do
    actual = School.add(@db, "Aimee", 2)
    assert actual == %{2 => ["Aimee"]}
  end

  test "a student can only be added to the same grade once" do
    actual =
      @db
      |> School.add("Aimee", 2)
      |> School.add("Aimee", 2)

    assert actual == %{2 => ["Aimee"]}
  end

  test "a student cannot be added to more than one grade" do
    actual =
      @db
      |> School.add("Aimee", 2)
      |> School.add("Aimee", 1)

    assert actual == %{2 => ["Aimee"]}
  end

  @tag :pending
  test "add more students in same class" do
    actual =
      @db
      |> School.add("James", 2)
      |> School.add("Blair", 2)
      |> School.add("Paul", 2)

    assert Enum.sort(actual[2]) == ["Blair", "James", "Paul"]
  end

  @tag :pending
  test "add students to different grades" do
    actual =
      @db
      |> School.add("Chelsea", 3)
      |> School.add("Logan", 7)

    assert actual == %{3 => ["Chelsea"], 7 => ["Logan"]}
  end

  @tag :pending
  test "get students in a grade" do
    actual =
      @db
      |> School.add("Bradley", 5)
      |> School.add("Franklin", 5)
      |> School.add("Jeff", 1)
      |> School.grade(5)

    assert Enum.sort(actual) == ["Bradley", "Franklin"]
  end

  @tag :pending
  test "get students in a non existent grade" do
    assert [] == School.grade(@db, 1)
  end

  @tag :pending
  test "sort school by grade and by student name" do
    actual =
      @db
      |> School.add("Peter", 2)
      |> School.add("Anna", 1)
      |> School.add("Barb", 1)
      |> School.add("Zoe", 2)
      |> School.add("Alex", 2)
      |> School.add("Jim", 3)
      |> School.add("Charlie", 1)
      |> School.sort()

    expected = [
      {1, ["Anna", "Barb", "Charlie"]},
      {2, ["Alex", "Peter", "Zoe"]},
      {3, ["Jim"]}
    ]

    assert expected == actual
  end
end
