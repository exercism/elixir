if System.get_env("EXERCISM_TEST_EXAMPLES") do
  Code.load_file("example.exs")
else
  Code.load_file("school.exs")
end

ExUnit.start
ExUnit.configure exclude: :pending, trace: true

defmodule SchoolTest do
  use ExUnit.Case

  def db, do: []

  test "add student" do
    actual = School.add(db, "Aimee", :grade_2)
    assert actual == [grade_2: ["Aimee"]]
  end

  @tag :pending
  test "add more students in same class" do
    actual = db
     |> School.add("James", :grade_2)
     |> School.add("Blair", :grade_2)
     |> School.add("Paul", :grade_2)

    assert Enum.sort(actual[:grade_2]) == ["Blair", "James", "Paul"]
  end

  @tag :pending
  test "add students to different grades" do
    actual = db
     |> School.add("Chelsea", :grade_3)
     |> School.add("Logan", :grade_7)

    assert actual == [grade_3: ["Chelsea"], grade_7: ["Logan"]]
  end

  @tag :pending
  test "get students in a grade" do
    actual = db
     |> School.add("Bradley", :grade_5)
     |> School.add("Franklin", :grade_5)
     |> School.add("Jeff", :grade_1)
     |> School.grade(:grade_5)

    assert Enum.sort(actual) == ["Bradley", "Franklin"]
  end

  @tag :pending
  test "get students in a non existent grade" do
    assert [] == School.grade(db, :grade_1)
  end

  @tag :pending
  test "sort school by grade and by student name" do
    actual = db
     |> School.add("Bart", :grade_4)
     |> School.add("Jennifer", :grade_4)
     |> School.add("Christopher", :grade_4)
     |> School.add("Kareem", :grade_6)
     |> School.add("Kyle", :grade_3)
     |> School.sort

    expected = [
     grade_3: ["Kyle"],
     grade_4: ["Bart", "Christopher", "Jennifer"],
     grade_6: ["Kareem"]
    ]

    assert expected == actual
  end
end
