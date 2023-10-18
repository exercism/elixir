defmodule WordCountTest do
  use ExUnit.Case

  test "count one word" do
    assert WordCount.count("word") == %{"word" => 1}
  end

  @tag :pending
  test "count one of each word" do
    expected = %{"one" => 1, "of" => 1, "each" => 1}
    assert WordCount.count("one of each") == expected
  end

  @tag :pending
  test "multiple occurrences of a word" do
    expected = %{"one" => 1, "fish" => 4, "two" => 1, "red" => 1, "blue" => 1}
    assert WordCount.count("one fish two fish red fish blue fish") == expected
  end

  @tag :pending
  test "handles cramped lists" do
    expected = %{"one" => 1, "two" => 1, "three" => 1}
    assert WordCount.count("one,two,three") == expected
  end

  @tag :pending
  test "handles expanded lists" do
    expected = %{"one" => 1, "two" => 1, "three" => 1}
    assert WordCount.count("one,\ntwo,\nthree") == expected
  end

  @tag :pending
  test "ignore punctuation" do
    expected = %{"car" => 1, "carpet" => 1, "as" => 1, "java" => 1, "javascript" => 1}
    assert WordCount.count("car : carpet as java : javascript!!&@$%^&") == expected
  end

  @tag :pending
  test "include numbers" do
    expected = %{"testing" => 2, "1" => 1, "2" => 1}
    assert WordCount.count("testing, 1, 2 testing") == expected
  end

  @tag :pending
  test "ignore underscores" do
    expected = %{"two" => 1, "words" => 1}
    assert WordCount.count("two_words") == expected
  end

  @tag :pending
  test "normalize case" do
    expected = %{"go" => 3, "stop" => 2}
    assert WordCount.count("go Go GO Stop stop") == expected
  end

  @tag :pending
  test "with apostrophes" do
    expected = %{
      "first" => 1,
      "don't" => 2,
      "laugh" => 1,
      "then" => 1,
      "cry" => 1,
      "you're" => 1,
      "getting" => 1,
      "it" => 1
    }

    assert WordCount.count("First: don't laugh. Then: don't cry. You're getting it.") == expected
  end

  @tag :pending
  test "with quotations" do
    expected = %{"joe" => 1, "can't" => 1, "tell" => 1, "between" => 1, "large" => 2, "and" => 1}
    assert WordCount.count("Joe can't tell between 'large' and large.") == expected
  end

  @tag :pending
  test "with quotations at the end and beginning of the sentence" do
    expected = %{"venti" => 1, "in" => 1, "italian" => 1, "means" => 1, "twenty" => 1}
    assert WordCount.count("'venti' in Italian means 'twenty'") == expected
  end

  @tag :pending
  test "substrings from the beginning" do
    expected = %{
      "joe" => 1,
      "can't" => 1,
      "tell" => 1,
      "between" => 1,
      "app" => 1,
      "apple" => 1,
      "and" => 1,
      "a" => 1
    }

    assert WordCount.count("Joe can't tell between app, apple and a.") == expected
  end

  @tag :pending
  test "multiple spaces not detected as a word" do
    expected = %{"multiple" => 1, "whitespaces" => 1}
    assert WordCount.count(" multiple   whitespaces") == expected
  end

  @tag :pending
  test "alternating word separators not detected as a word" do
    expected = %{"one" => 1, "two" => 1, "three" => 1}
    assert WordCount.count(",\n,one,\n ,two \n 'three'") == expected
  end

  @tag :pending
  test "quotation for word with apostrophe" do
    expected = %{"can" => 1, "can't" => 2}
    assert WordCount.count("can, can't, 'can't'") == expected
  end
end
