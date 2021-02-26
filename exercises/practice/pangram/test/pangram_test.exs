defmodule PangramTest do
  use ExUnit.Case

  # @tag :pending
  test "empty sentence" do
    refute Pangram.pangram?("")
  end

  @tag :pending
  test "prefect lower case" do
    assert Pangram.pangram?("abcdefghijklmnopqrstuvwxyz")
  end

  @tag :pending
  test "pangram with only lower case" do
    assert Pangram.pangram?("the quick brown fox jumps over the lazy dog")
  end

  @tag :pending
  test "missing character 'x'" do
    refute Pangram.pangram?("a quick movement of the enemy will jeopardize five gunboats")
  end

  @tag :pending
  test "another missing character 'x'" do
    refute Pangram.pangram?("the quick brown fish jumps over the lazy dog")
  end

  @tag :pending
  test "missing character 'h'" do
    refute Pangram.pangram?("five boxing wizards jump quickly at it")
  end

  @tag :pending
  test "pangram with underscores" do
    assert Pangram.pangram?("the_quick_brown_fox_jumps_over_the_lazy_dog")
  end

  @tag :pending
  test "pangram with numbers" do
    assert Pangram.pangram?("the 1 quick brown fox jumps over the 2 lazy dogs")
  end

  @tag :pending
  test "missing letters replaced by numbers" do
    refute Pangram.pangram?("7h3 qu1ck brown fox jumps ov3r 7h3 lazy dog")
  end

  @tag :pending
  test "pangram with mixed case and punctuation" do
    assert Pangram.pangram?("\"Five quacking Zephyrs jolt my wax bed.\"")
  end

  @tag :pending
  test "case insensitive" do
    assert Pangram.pangram?("the quick brown fox jumps over the lazy DOG")
    refute Pangram.pangram?("the quick brown fox jumps over with lazy FX")
  end

  @tag :pending
  test "pangram with non ascii characters" do
    assert Pangram.pangram?("Victor jagt zwölf Boxkämpfer quer über den großen Sylter Deich.")
  end

  @tag :pending
  test "pangram in alphabet other than ASCII" do
    refute Pangram.pangram?(
             "Широкая электрификация южных губерний даст мощный толчок подъёму сельского хозяйства."
           )
  end
end
