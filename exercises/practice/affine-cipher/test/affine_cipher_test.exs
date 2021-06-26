defmodule AffineCipherTest do
  use ExUnit.Case

  # The test are divided into two groups:
  # * Encoding from English to affine cipher
  # * Decoding from affine cipher to all-lowercase-mashed-together English
  describe "encode" do
    # Test encoding from English to ciphertext with keys
    # @tag :pending
    test "encode yes" do
      key = %{a: 5, b: 7}
      phrase = "yes"
      output = AffineCipher.encode(key, phrase)
      expected = {:ok, "xbt"}

      assert output == expected
    end

    @tag :pending
    test "encode no" do
      key = %{a: 15, b: 18}
      phrase = "no"
      output = AffineCipher.encode(key, phrase)
      expected = {:ok, "fu"}

      assert output == expected
    end

    @tag :pending
    test "encode OMG" do
      key = %{a: 21, b: 3}
      phrase = "OMG"
      output = AffineCipher.encode(key, phrase)
      expected = {:ok, "lvz"}

      assert output == expected
    end

    @tag :pending
    test "encode O M G" do
      key = %{a: 25, b: 47}
      phrase = "O M G"
      output = AffineCipher.encode(key, phrase)
      expected = {:ok, "hjp"}

      assert output == expected
    end

    @tag :pending
    test "encode mindblowingly" do
      key = %{a: 11, b: 15}
      phrase = "mindblowingly"
      output = AffineCipher.encode(key, phrase)
      expected = {:ok, "rzcwa gnxzc dgt"}

      assert output == expected
    end

    @tag :pending
    test "encode numbers" do
      key = %{a: 3, b: 4}
      phrase = "Testing,1 2 3, testing."
      output = AffineCipher.encode(key, phrase)
      expected = {:ok, "jqgjc rw123 jqgjc rw"}

      assert output == expected
    end

    @tag :pending
    test "encode deep thought" do
      key = %{a: 5, b: 17}
      phrase = "Truth is fiction."
      output = AffineCipher.encode(key, phrase)
      expected = {:ok, "iynia fdqfb ifje"}

      assert output == expected
    end

    @tag :pending
    test "encode all the letters" do
      key = %{a: 17, b: 33}
      phrase = "The quick brown fox jumps over the lazy dog."
      output = AffineCipher.encode(key, phrase)
      expected = {:ok, "swxtj npvyk lruol iejdc blaxk swxmh qzglf"}

      assert output == expected
    end

    @tag :pending
    test "encode with a not coprime to m" do
      key = %{a: 6, b: 17}
      phrase = "This is a test."
      output = AffineCipher.encode(key, phrase)
      expected = {:error, "a and m must be coprime."}

      assert output == expected
    end
  end

  describe "decode" do
    # Test decoding from ciphertext to English with keys
    @tag :pending
    test "decode exercism" do
      key = %{a: 3, b: 7}
      phrase = "tytgn fjr"
      output = AffineCipher.decode(key, phrase)
      expected = {:ok, "exercism"}

      assert output == expected
    end

    @tag :pending
    test "decode a sentence" do
      key = %{a: 19, b: 16}
      phrase = "qdwju nqcro muwhn odqun oppmd aunwd o"
      output = AffineCipher.decode(key, phrase)
      expected = {:ok, "anobstacleisoftenasteppingstone"}

      assert output == expected
    end

    @tag :pending
    test "decode numbers" do
      key = %{a: 25, b: 7}
      phrase = "odpoz ub123 odpoz ub"
      output = AffineCipher.decode(key, phrase)
      expected = {:ok, "testing123testing"}

      assert output == expected
    end

    @tag :pending
    test "decode all the letters" do
      key = %{a: 17, b: 33}
      phrase = "swxtj npvyk lruol iejdc blaxk swxmh qzglf"
      output = AffineCipher.decode(key, phrase)
      expected = {:ok, "thequickbrownfoxjumpsoverthelazydog"}

      assert output == expected
    end

    @tag :pending
    test "decode with no spaces in input" do
      key = %{a: 17, b: 33}
      phrase = "swxtjnpvyklruoliejdcblaxkswxmhqzglf"
      output = AffineCipher.decode(key, phrase)
      expected = {:ok, "thequickbrownfoxjumpsoverthelazydog"}

      assert output == expected
    end

    @tag :pending
    test "decode with too many spaces" do
      key = %{a: 15, b: 16}
      phrase = "vszzm    cly   yd cg    qdp"
      output = AffineCipher.decode(key, phrase)
      expected = {:ok, "jollygreengiant"}

      assert output == expected
    end

    @tag :pending
    test "decode with a not coprime to m" do
      key = %{a: 13, b: 5}
      phrase = "Test"
      output = AffineCipher.decode(key, phrase)
      expected = {:error, "a and m must be coprime."}

      assert output == expected
    end
  end
end
