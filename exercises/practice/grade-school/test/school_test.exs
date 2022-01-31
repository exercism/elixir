defmodule SchoolTest do
  use ExUnit.Case

  def make_school_with_students(students) do
    {results, school} =
      Enum.reduce(students, {[], School.new()}, fn {student, grade}, {results, school} ->
        {result, school} = School.add(school, student, grade)
        {[result | results], school}
      end)

    {Enum.reverse(results), school}
  end

  # @tag :pending
  test "Roster is empty when no student is added" do
    assert School.roster(School.new()) == []
  end

  @tag :pending
  test "Add a student" do
    {result, school} = School.add(School.new(), "Aimee", 2)

    assert result == :ok
    assert School.roster(school) == ["Aimee"]
  end

  @tag :pending
  test "Adding multiple students in the same grade in the roster" do
    students = [{"Blair", 2}, {"James", 2}, {"Paul", 2}]
    {results, school} = make_school_with_students(students)

    assert results == [:ok, :ok, :ok]
    assert School.roster(school) == ["Blair", "James", "Paul"]
  end

  @tag :pending
  test "Cannot add student to same grade in the roster more than once" do
    students = [{"Blair", 2}, {"James", 2}, {"James", 2}, {"Paul", 2}]
    {results, school} = make_school_with_students(students)

    assert results == [:ok, :ok, :error, :ok]
    assert School.roster(school) == ["Blair", "James", "Paul"]
  end

  @tag :pending
  test "Adding students in multiple grades" do
    students = [{"Chelsea", 3}, {"Logan", 7}]
    {results, school} = make_school_with_students(students)

    assert results == [:ok, :ok]
    assert School.roster(school) == ["Chelsea", "Logan"]
  end

  @tag :pending
  test "Cannot add same student to multiple grades in the roster" do
    students = [{"Blair", 2}, {"James", 2}, {"James", 3}, {"Paul", 3}]
    {results, school} = make_school_with_students(students)

    assert results == [:ok, :ok, :error, :ok]
    assert School.roster(school) == ["Blair", "James", "Paul"]
  end

  @tag :pending
  test "Students are sorted by grades in the roster" do
    students = [{"Jim", 3}, {"Peter", 2}, {"Anna", 1}]
    {_results, school} = make_school_with_students(students)

    assert School.roster(school) == ["Anna", "Peter", "Jim"]
  end

  @tag :pending
  test "Students are sorted by name in the roster" do
    students = [{"Peter", 2}, {"Zoe", 2}, {"Alex", 2}]
    {_results, school} = make_school_with_students(students)

    assert School.roster(school) == ["Alex", "Peter", "Zoe"]
  end

  @tag :pending
  test "Students are sorted by grades and then by name in the roster" do
    students = [
      {"Peter", 2},
      {"Anna", 1},
      {"Barb", 1},
      {"Zoe", 2},
      {"Alex", 2},
      {"Jim", 3},
      {"Charlie", 1}
    ]

    {_results, school} = make_school_with_students(students)

    assert School.roster(school) == ["Anna", "Barb", "Charlie", "Alex", "Peter", "Zoe", "Jim"]
  end

  @tag :pending
  test "Grade is empty if no students in the roster" do
    assert School.grade(School.new(), 1) == []
  end

  @tag :pending
  test "Grade is empty if no students in that grade" do
    students = [{"Peter", 2}, {"Zoe", 2}, {"Alex", 2}, {"Jim", 3}]
    {_results, school} = make_school_with_students(students)

    assert School.grade(school, 1) == []
  end

  @tag :pending
  test "Student not added to same grade more than once" do
    students = [{"Blair", 2}, {"James", 2}, {"James", 2}, {"Paul", 2}]
    {_results, school} = make_school_with_students(students)

    assert School.roster(school) == ["Blair", "James", "Paul"]
  end

  @tag :pending
  test "Student not added to multiple grades" do
    students = [{"Blair", 2}, {"James", 2}, {"James", 3}, {"Paul", 3}]
    {_results, school} = make_school_with_students(students)

    assert School.grade(school, 2) == ["Blair", "James"]
    assert School.grade(school, 3) == ["Paul"]
  end

  @tag :pending
  test "Students are sorted by name in a grade" do
    students = [{"Franklin", 5}, {"Bradley", 5}, {"Jeff", 1}]
    {_results, school} = make_school_with_students(students)

    assert School.grade(school, 5) == ["Bradley", "Franklin"]
  end
end
