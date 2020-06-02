defmodule NameBadge do
  def print(id, name, department) do
    department = if department, do: department, else: "owner"
    prefix = if id, do: "[#{id}] - ", else: ""

    prefix <> "#{name} - #{String.upcase(department)}"
  end
end
