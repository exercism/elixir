if !System.get_env("EXERCISM_TEST_EXAMPLES") do
  Code.load_file("school.exs")
end

ExUnit.start
ExUnit.configure exclude: :pending, trace: true

defmodule SchoolTest do
  use ExUnit.Case

  def db, do: %{}

  test "add student" do
    actual = School.add(db, "Aimee", 2)
    assert actual == %{2 =>["Aimee"]}
  end

  @tag :pending
  test "add more students in same class" do
    actual = db
     |> School.add("James", 2)
     |> School.add("Blair", 2)
     |> School.add("Paul", 2)

    assert Enum.sort(actual[2]) == ["Blair", "James", "Paul"]
  end

  @tag :pending
  test "add students to different grades" do
    actual = db
     |> School.add("Chelsea", 3)
     |> School.add("Logan", 7)

    assert actual == %{3 => ["Chelsea"], 7 => ["Logan"]}
  end

  @tag :pending
  test "get students in a grade" do
    actual = db
     |> School.add("Bradley", 5)
     |> School.add("Franklin", 5)
     |> School.add("Jeff", 1)
     |> School.grade(5)

    assert Enum.sort(actual) == ["Bradley", "Franklin"]
  end

  @tag :pending
  test "get students in a non existent grade" do
    assert [] == School.grade(db, 1)
  end

  @tag :pending
  test "sort school by grade and by student name" do
    actual = db
    |> School.add("Bart", 4)
    |> School.add("Jennifer", 4)
    |> School.add("Christopher", 4)
    |> School.add("Kareem", 6)
    |> School.add("Kyle", 3)
    |> School.sort

    expected = [
      {3, ["Kyle"]},
      {4, ["Bart", "Christopher", "Jennifer"]},
      {6, ["Kareem"]}
    ]

    assert expected == actual
  end
end
