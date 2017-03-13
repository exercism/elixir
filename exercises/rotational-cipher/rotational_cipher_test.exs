if !System.get_env("EXERCISM_TEST_EXAMPLES") do
  Code.load_file("rotational_cipher.exs", __DIR__)
end

ExUnit.start
ExUnit.configure exclude: :pending, trace: true

defmodule RotationalCipherTest do
  use ExUnit.Case

  #@tag :pending
  test "rotate a by 1" do
    plaintext = "a"
    shift = 1
    assert RotationalCipher.rotate(plaintext, shift) == "b"
  end

  @tag :pending
  test "rotate a by 26, same output as input" do
    plaintext = "a"
    shift = 26
    assert RotationalCipher.rotate(plaintext, shift) == "a"
  end

  @tag :pending
  test "rotate a by 0, same output as input" do
    plaintext = "a"
    shift = 0
    assert RotationalCipher.rotate(plaintext, shift) == "a"
  end

  @tag :pending
  test "rotate m by 13" do
    plaintext = "m"
    shift = 13
    assert RotationalCipher.rotate(plaintext, shift) == "z"
  end

  @tag :pending
  test "rotate n by 13 with wrap around alphabet" do
    plaintext = "n"
    shift = 13
    assert RotationalCipher.rotate(plaintext, shift) == "a"
  end

  @tag :pending
  test "rotate capital letters" do
    plaintext = "OMG"
    shift = 5
    assert RotationalCipher.rotate(plaintext, shift) == "TRL"
  end

  @tag :pending
  test "rotate spaces" do
    plaintext = "O M G"
    shift = 5
    assert RotationalCipher.rotate(plaintext, shift) == "T R L"
  end

  @tag :pending
  test "rotate numbers" do
    plaintext = "Testing 1 2 3 testing"
    shift = 4
    assert RotationalCipher.rotate(plaintext, shift) == "Xiwxmrk 1 2 3 xiwxmrk"
  end

  @tag :pending
  test "rotate punctuation" do
    plaintext = "Let's eat, Grandma!"
    shift = 21
    assert RotationalCipher.rotate(plaintext, shift) == "Gzo'n zvo, Bmviyhv!"
  end

  @tag :pending
  test "rotate all letters" do
    plaintext = "The quick brown fox jumps over the lazy dog."
    shift = 13
    assert RotationalCipher.rotate(plaintext, shift) == "Gur dhvpx oebja sbk whzcf bire gur ynml qbt."
  end
end
