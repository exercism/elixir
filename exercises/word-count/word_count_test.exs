if !System.get_env("EXERCISM_TEST_EXAMPLES") do
  Code.load_file("word_count.exs", __DIR__)
end

ExUnit.start()
ExUnit.configure(exclude: :pending, trace: true)

defmodule WordsTest do
  use ExUnit.Case

  test "count one word" do
    assert Words.count("word") == %{"word" => 1}
  end

  @tag :pending
  test "count one of each" do
    expected = %{"one" => 1, "of" => 1, "each" => 1}
    assert Words.count("one of each") == expected
  end

  @tag :pending
  test "count multiple occurrences" do
    expected = %{"one" => 1, "fish" => 4, "two" => 1, "red" => 1, "blue" => 1}
    assert Words.count("one fish two fish red fish blue fish") == expected
  end

  @tag :pending
  test "ignore punctuation" do
    expected = %{"car" => 1, "carpet" => 1, "as" => 1, "java" => 1, "javascript" => 1}
    assert Words.count("car : carpet as java : javascript!!&@$%^&") == expected
  end

  @tag :pending
  test "include numbers" do
    expected = %{"testing" => 2, "1" => 1, "2" => 1}
    assert Words.count("testing, 1, 2 testing") == expected
  end

  @tag :pending
  test "hyphens" do
    expected = %{"co-operative" => 1}
    assert Words.count("co-operative") == expected
  end

  @tag :pending
  test "ignore underscores" do
    expected = %{"two" => 1, "words" => 1}
    assert Words.count("two_words") == expected
  end

  @tag :pending
  test "normalize case" do
    expected = %{"go" => 3}
    assert Words.count("go Go GO") == expected
  end

  @tag :pending
  test "German" do
    expected = %{"götterfunken" => 1, "schöner" => 1, "freude" => 1}
    assert Words.count("Freude schöner Götterfunken") == expected
  end
end
