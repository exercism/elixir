defmodule ETLTest do
  use ExUnit.Case

  # @tag :pending
  test "single letter" do
    old = %{1 => ["A"]}
    expected = %{"a" => 1}

    assert ETL.transform(old) == expected
  end

  @tag :pending
  test "single score with multiple letters" do
    old = %{1 => ~W(A E I O U)}
    expected = %{"a" => 1, "e" => 1, "i" => 1, "o" => 1, "u" => 1}

    assert ETL.transform(old) == expected
  end

  @tag :pending
  test "multiple scores with multiple letters" do
    old = %{1 => ["A", "E"], 2 => ["D", "G"]}

    expected = %{
      "a" => 1,
      "d" => 2,
      "e" => 1,
      "g" => 2
    }

    assert ETL.transform(old) == expected
  end

  @tag :pending
  test "multiple scores with differing numbers of letters" do
    old = %{
      1 => ~W(A E I O U L N R S T),
      2 => ~W(D G),
      3 => ~W(B C M P),
      4 => ~W(F H V W Y),
      5 => ~W(K),
      8 => ~W(J X),
      10 => ~W(Q Z)
    }

    expected = %{
      "a" => 1,
      "b" => 3,
      "c" => 3,
      "d" => 2,
      "e" => 1,
      "f" => 4,
      "g" => 2,
      "h" => 4,
      "i" => 1,
      "j" => 8,
      "k" => 5,
      "l" => 1,
      "m" => 3,
      "n" => 1,
      "o" => 1,
      "p" => 3,
      "q" => 10,
      "r" => 1,
      "s" => 1,
      "t" => 1,
      "u" => 1,
      "v" => 4,
      "w" => 4,
      "x" => 8,
      "y" => 4,
      "z" => 10
    }

    assert ETL.transform(old) == expected
  end
end
