defmodule School do
  @moduledoc """
  Simulate students in a school.

  Each student is in a grade.
  """

  @doc """
  Add a student to a particular grade in school.
  """
  @spec add([{atom, any}], String.t, atom) :: [{atom, any}]
  def add(db, name, grade) do

  end

  @doc """
  Return the names of the students in a particular grade.
  """
  @spec grade([{atom, any}], atom) :: any
  def grade(db, grade) do

  end

  @doc """
  Sorts the school by grade and name.
  """
  @spec sort([{atom, any}]) :: [{atom, any}]
  def sort(db) do

  end
end
