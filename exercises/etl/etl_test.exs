if !System.get_env("EXERCISM_TEST_EXAMPLES") do
  Code.load_file("etl.exs")
end

ExUnit.start
ExUnit.configure exclude: :pending, trace: true

defmodule TransformTest do
  use ExUnit.Case

  # @tag :pending
  test "transform one value" do
    old = %{1 => ["WORLD"]}
    expected = %{"world" => 1}

    assert ETL.transform(old) == expected
  end

  @tag :pending
  test "transform more values" do
    old = %{1 => ["WORLD", "GSCHOOLERS"]}
    expected = %{"world" => 1, "gschoolers" => 1}

    assert ETL.transform(old) == expected
  end

  @tag :pending
  test "more keys" do
    old = %{1 => ["APPLE", "ARTICHOKE"], 2 => ["BOAT", "BALLERINA"]}
    expected = %{
      "apple" => 1,
      "artichoke" => 1,
      "boat" => 2,
      "ballerina" => 2
    }

    assert ETL.transform(old) == expected
  end

  @tag :pending
  test "full dataset" do
    old = %{
      1 =>  ~W(A E I O U L N R S T),
      2 =>  ~W(D G),
      3 =>  ~W(B C M P),
      4 =>  ~W(F H V W Y),
      5 =>  ~W(K),
      8 =>  ~W(J X),
      10 => ~W(Q Z)
    }

    expected = %{
      "a" => 1, "b" => 3,  "c" => 3, "d" => 2, "e" => 1,
      "f" => 4, "g" => 2,  "h" => 4, "i" => 1, "j" => 8,
      "k" => 5, "l" => 1,  "m" => 3, "n" => 1, "o" => 1,
      "p" => 3, "q" => 10, "r" => 1, "s" => 1, "t" => 1,
      "u" => 1, "v" => 4,  "w" => 4, "x" => 8, "y" => 4,
      "z" => 10
    }

    assert ETL.transform(old) == expected
  end
end
