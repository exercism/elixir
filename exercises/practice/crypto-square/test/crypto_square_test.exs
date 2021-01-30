defmodule CryptoSquareTest do
  use ExUnit.Case

  # @tag :pending
  test "empty plaintext results in an empty ciphertext" do
    assert CryptoSquare.encode("") == ""
  end

  @tag :pending
  test "lowercase" do
    assert CryptoSquare.encode("A") == "a"
  end

  @tag :pending
  test "remove spaces" do
    assert CryptoSquare.encode("  b ") == "b"
  end

  @tag :pending
  test "remove punctuation" do
    assert CryptoSquare.encode("@1,%!") == "1"
  end

  @tag :pending
  test "9 character plaintext results in 3 chunks of 3 characters" do
    assert CryptoSquare.encode("This is fun!") == "tsf hiu isn"
  end

  @tag :pending
  test "8 character plaintext results in 3 chunks, the last one with a trailing space" do
    assert CryptoSquare.encode("Chill out.") == "clu hlt io "
  end

  @tag :pending
  test "54 character plaintext results in 7 chunks, the last two with trailing spaces" do
    msg = "If man was meant to stay on the ground, god would have given us roots."
    cipher = "imtgdvs fearwer mayoogo anouuio ntnnlvt wttddes aohghn  sseoau "
    assert CryptoSquare.encode(msg) == cipher
  end
end
