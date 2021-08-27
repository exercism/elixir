defmodule SimpleCipherTest do
  use ExUnit.Case

  # @tag :pending
  test "encoding with 'a' returns the original text" do
    assert SimpleCipher.encode("a", "a") == "a"
    assert SimpleCipher.encode("b", "a") == "b"
    assert SimpleCipher.encode("c", "a") == "c"
  end

  @tag :pending
  test "encoding with another key returns shifted text" do
    assert SimpleCipher.encode("a", "d") == "d"
    assert SimpleCipher.encode("b", "d") == "e"
    assert SimpleCipher.encode("c", "d") == "f"
  end

  @tag :pending
  test "decoding with 'a' returns the original text" do
    assert SimpleCipher.decode("a", "a") == "a"
    assert SimpleCipher.decode("b", "a") == "b"
    assert SimpleCipher.decode("c", "a") == "c"
  end

  @tag :pending
  test "decoding with another key returns unshifted text" do
    assert SimpleCipher.decode("d", "d") == "a"
    assert SimpleCipher.decode("e", "d") == "b"
    assert SimpleCipher.decode("f", "d") == "c"
  end

  @tag :pending
  test "key uses per-letter translation for encoding" do
    key = "abc"

    assert SimpleCipher.encode("abc", key) == "ace"
    assert SimpleCipher.encode("bcd", key) == "bdf"
    assert SimpleCipher.encode("cde", key) == "ceg"
    assert SimpleCipher.encode("aaaaaaaaaa", "abcdefghij") == "abcdefghij"
  end

  @tag :pending
  test "key uses per-letter translation for decoding" do
    key = "abc"

    assert SimpleCipher.decode("ace", key) == "abc"
    assert SimpleCipher.decode("bdf", key) == "bcd"
    assert SimpleCipher.decode("ceg", key) == "cde"
    assert SimpleCipher.decode("abcdefghij", "abcdefghij") == "aaaaaaaaaa"
  end

  @tag :pending
  test "reversible" do
    key = "abcdefghij"
    plaintext = "abcdefghij"

    assert plaintext |> SimpleCipher.encode(key) |> SimpleCipher.decode(key) == plaintext
  end

  @tag :pending
  test "can double shift encode" do
    assert SimpleCipher.encode("iamapandabear", "iamapandabear") == "qayaeaagaciai"
  end

  @tag :pending
  test "can wrap on encode" do
    assert SimpleCipher.encode("zzzzzzzzzz", "abcdefghij") == "zabcdefghi"
  end

  @tag :pending
  test "can wrap on decode" do
    assert SimpleCipher.decode("zabcdefghi", "abcdefghij") == "zzzzzzzzzz"
  end

  @tag :pending
  test "can encode messages longer than the key" do
    assert SimpleCipher.encode("abc", "a") == "abc"
    assert SimpleCipher.encode("abcdefghi", "abc") == "acedfhgik"
    assert SimpleCipher.encode("iamapandabear", "abc") == "iboaqcnecbfcr"
  end

  @tag :pending
  test "can decode messages longer than the key" do
    assert SimpleCipher.decode("abc", "a") == "abc"
    assert SimpleCipher.decode("acedfhgik", "abc") == "abcdefghi"
    assert SimpleCipher.decode("iboaqcnecbfcr", "abc") == "iamapandabear"
  end

  @tag :pending
  test "if key is longer than text, only use as much as needed" do
    key = "somewhatlongkey"

    assert SimpleCipher.encode("abc", key) == "spo"
    assert SimpleCipher.decode("abc", key) == "inq"
  end

  @tag :pending
  test "if you know both the encoded and decoded text, you can figure out the key" do
    key = "supersecretkey"

    plaintext = "attackxatxdawn"
    ciphertext = SimpleCipher.encode(plaintext, key)

    assert SimpleCipher.decode(ciphertext, plaintext) == key
  end

  @tag :pending
  test "can generate keys of given length" do
    assert String.length(SimpleCipher.generate_key(16)) == 16
    assert String.length(SimpleCipher.generate_key(128)) == 128
    assert String.length(SimpleCipher.generate_key(256)) == 256
  end

  @tag :pending
  test "generated keys are random" do
    keys = Enum.map(0..100, fn _ -> SimpleCipher.generate_key(16) end)
    assert keys == Enum.uniq(keys)
  end

  @tag :pending
  test "generated keys contain lowercase letters only" do
    keys = Enum.map(0..100, fn _ -> SimpleCipher.generate_key(16) end)
    assert Enum.all?(keys, &(&1 =~ ~r/^[a-z]*$/))
  end

  @tag :pending
  test "generated keys can be used to encode and decode text" do
    Enum.each(0..100, fn _ ->
      key = SimpleCipher.generate_key(16)
      plaintext = "iamapandabear"
      assert plaintext |> SimpleCipher.encode(key) |> SimpleCipher.decode(key) == plaintext
    end)
  end
end
