defmodule School do
  def add(db, name, grade) do
    if name in List.flatten(Map.values(db)) do
      db
    else
      Map.update(db, grade, [name], &[name | &1])
    end
  end

  def grade(db, grade) do
    Map.get(db, grade, [])
  end

  def sort(db) do
    db
    |> Enum.map(fn {k, v} -> {k, Enum.sort(v)} end)
    |> Enum.sort()
  end
end
