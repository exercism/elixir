defmodule School do
  def add(db, name, grade) do
    Keyword.update(db, grade, [name], &[name|&1])
  end

  def grade(db, grade) do
    Keyword.get(db, grade, [])
  end

  def sort(db) do
    db
    |> Enum.map(fn {k,v} -> {k, Enum.sort(v)} end)
    |> Enum.sort
  end
end
