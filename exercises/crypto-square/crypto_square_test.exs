if !System.get_env("EXERCISM_TEST_EXAMPLES") do
  Code.load_file("crypto_square.exs", __DIR__)
end

ExUnit.start
ExUnit.configure trace: true

defmodule CryptoSquareTest do
  use ExUnit.Case

  # @tag :skip
  test "empty string" do
    assert CryptoSquare.encode("") == ""
  end

  @tag :skip
  test "perfect square" do
    assert CryptoSquare.encode("abcd") == "ac bd"
  end

  @tag :skip
  test "uppercase string" do
    assert CryptoSquare.encode("ABCD") == "ac bd"
  end

  @tag :skip
  test "small imperfect square" do
    assert CryptoSquare.encode("This is easy") == "tis hsy ie sa"
  end

  @tag :skip
  test "punctuation and numbers" do
    assert CryptoSquare.encode("1, 2, 3, Go! Go, for God's sake!") == "1gga 2ook 3fde gos ors"
  end

  @tag :skip
  test "long string" do
    msg = "If man was meant to stay on the ground, god would have given us roots."
    cipher = "imtgdvs fearwer mayoogo anouuio ntnnlvt wttddes aohghn sseoau"
    assert CryptoSquare.encode(msg) == cipher
  end
end
