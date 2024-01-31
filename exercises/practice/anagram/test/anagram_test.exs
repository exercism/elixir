defmodule AnagramTest do
  use ExUnit.Case

  # @tag :pending
  test "no matches" do
    matches = Anagram.match("diaper", ~w(hello world zombies pants))
    assert matches == []
  end

  @tag :pending
  test "detects two anagrams" do
    matches = Anagram.match("solemn", ~w(lemons cherry melons))
    assert matches == ~w(lemons melons)
  end

  @tag :pending
  test "does not detect anagram subsets" do
    matches = Anagram.match("good", ~w(dog goody))
    assert matches == []
  end

  @tag :pending
  test "detects anagram" do
    matches = Anagram.match("listen", ~w(enlists google inlets banana))
    assert matches == ~w(inlets)
  end

  @tag :pending
  test "detects three anagrams" do
    matches = Anagram.match("allergy", ~w(gallery ballerina regally clergy largely leading))
    assert matches == ~w(gallery regally largely)
  end

  @tag :pending
  test "detects multiple anagrams with different case" do
    matches = Anagram.match("nose", ~w(Eons ONES))
    assert matches == ~w(Eons ONES)
  end

  @tag :pending
  test "does not detect non-anagrams with identical checksum" do
    matches = Anagram.match("mass", ~w(last))
    assert matches == []
  end

  @tag :pending
  test "detect anagrams case-insensitively" do
    matches = Anagram.match("orchestra", ~w(cashregister Carthorse radishes))
    assert matches == ~w(Carthorse)
  end

  @tag :pending
  test "detects anagrams using case-insensitive subject" do
    matches = Anagram.match("Orchestra", ~w(cashregister carthorse radishes))
    assert matches == ~w(carthorse)
  end

  @tag :pending
  test "detects anagrams using case-insensitive possible matches" do
    matches = Anagram.match("orchestra", ~w(cashregister Carthorse radishes))
    assert matches == ~w(Carthorse)
  end

  @tag :pending
  test "does not detect an anagram if the original word is repeated" do
    matches = Anagram.match("go", ~w(goGoGO))
    assert matches == []
  end

  @tag :pending
  test "anagrams must use all letters exactly once" do
    matches = Anagram.match("tapper", ~w(patter))
    assert matches == []
  end

  @tag :pending
  test "words are not anagrams of themselves" do
    matches = Anagram.match("BANANA", ~w(BANANA))
    assert matches == []
  end

  @tag :pending
  test "words are not anagrams of themselves even if letter case is partially different" do
    matches = Anagram.match("BANANA", ~w(Banana))
    assert matches == []
  end

  @tag :pending
  test "words are not anagrams of themselves even if letter case is completely different" do
    matches = Anagram.match("BANANA", ~w(banana))
    assert matches == []
  end

  @tag :pending
  test "words other than themselves can be anagrams" do
    matches = Anagram.match("LISTEN", ~w(Silent LISTEN))
    assert matches == ~w(Silent)
  end

  @tag :pending
  test "handles case of greek letters" do
    matches = Anagram.match("ΑΒΓ", ~w(ΒΓΑ ΒΓΔ γβα αβγ))
    assert matches == ~w(ΒΓΑ γβα)
  end

  @tag :pending
  test "different characters may have the same bytes" do
    matches =
      Anagram.match(
        # binary representation: <<0x61, 0xE2, 0xAC, 0x82>>
        "a⬂",
        # binary representation: <<0xE2, 0x82, 0xAC, 0x61>>
        ["€a"]
      )

    assert matches == []
  end
end
