if !System.get_env("EXERCISM_TEST_EXAMPLES") do
  Code.load_file("diamond.exs")
end

ExUnit.start
ExUnit.configure exclude: :pending, trace: true

defmodule DiamondTest do
  use ExUnit.Case

  # @tag :pending
  test "first row contain A" do
    first_letter =
      Diamond.build_shape(?E)
      |> String.replace(" ", "")
      |> String.split("\n", trim: true)
      |> List.first
    assert first_letter == "A"
  end

  @tag :pending
  test "last row contain A" do
    last_letter =
      Diamond.build_shape(?E)
      |> String.replace(" ", "")
      |> String.split("\n", trim: true)
      |> List.last
    assert last_letter == "A"
  end

  @tag :pending
  test "all rows, except the first and last, have exactly two identical letters" do
    is_identical_letters =
      Diamond.build_shape(?E)
      |> String.replace(" ", "")
      |> String.slice(2..-2)
      |> String.split("\n", trim: true)
      |> Enum.all?(fn x ->
        String.length(x) == 2 and
        x |> String.codepoints |> MapSet.new |> MapSet.size == 1
      end)
    assert is_identical_letters
  end

  @tag :pending
  test "the diamond has a square shape (width equals height)" do
    shape = Diamond.build_shape(?E) |> String.split("\n", trim: true)
    width = shape |> List.first |> String.length
    height = length(shape)
    assert width == height
  end

  @tag :pending
  test "letters form a diamond shape" do
    shape = Diamond.build_shape(?E)
    assert shape == """
\s   A    
\s  B B   
\s C   C  
\sD     D 
 E       E
\sD     D 
\s C   C  
\s  B B   
\s   A    
    """
  end
end
