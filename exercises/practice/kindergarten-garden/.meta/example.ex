defmodule Garden do
  @default_names [
    :alice,
    :bob,
    :charlie,
    :david,
    :eve,
    :fred,
    :ginny,
    :harriet,
    :ileana,
    :joseph,
    :kincaid,
    :larry
  ]
  @letter_map %{"V" => :violets, "R" => :radishes, "C" => :clover, "G" => :grass}

  @doc """
    Accepts a string representing the arrangement of cups on a windowsill and a
    list with names of students in the class. The student names list does not
    have to be in alphabetical order.

    It decodes that string into the various gardens for each student and returns
    that information in a map.
  """

  @spec info(String.t(), list) :: map
  def info(info_string, student_names \\ @default_names) do
    student_names = Enum.sort(student_names)
    map = create_map(student_names)
    [first_row, second_row] = String.split(info_string, "\n")
    populate_map(first_row, second_row, map, student_names)
  end

  defp create_map(student_names) do
    create_map(student_names, %{})
  end

  defp create_map([], map), do: map

  defp create_map([h | t], map) do
    map = Map.put(map, h, nil)
    create_map(t, map)
  end

  defp populate_map(_, _, map, []), do: map

  defp populate_map(first_row, second_row, map, [current_name | student_names]) do
    first_row_letters = String.slice(first_row, 0..1)
    second_row_letters = String.slice(second_row, 0..1)
    letters = "#{first_row_letters}#{second_row_letters}"
    map = add_to_map(map, current_name, letters)

    first_row = String.slice(first_row, 2..-1//-1)
    second_row = String.slice(second_row, 2..-1//-1)
    populate_map(first_row, second_row, map, student_names)
  end

  defp add_to_map(map, current_name, letters) do
    letters = String.codepoints(letters)
    translated_list = Enum.map(letters, fn letter -> @letter_map[letter] end)
    tuple = List.to_tuple(translated_list)
    Map.put(map, current_name, tuple)
  end
end
