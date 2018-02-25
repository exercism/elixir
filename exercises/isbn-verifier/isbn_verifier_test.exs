if !System.get_env("EXERCISM_TEST_EXAMPLES") do
  Code.load_file("isbn_verifier.exs", __DIR__)
end

ExUnit.start()
ExUnit.configure(exclude: :pending, trace: true)

defmodule ISBNVerifierTest do
  use ExUnit.Case

  # @tag :pending
  test "valid isbn number" do
    assert ISBNVerifier.isbn?("3-598-21508-8")
  end

  @tag :pending
  test "invalid isbn check digit" do
    refute ISBNVerifier.isbn?("3-598-21508-9")
  end

  @tag :pending
  test "valid isbn number with a check digit of 10" do
    assert ISBNVerifier.isbn?("3-598-21507-X")
  end

  @tag :pending
  test "check digit is a character other than X" do
    refute ISBNVerifier.isbn?("3-598-21507-A")
  end

  @tag :pending
  test "invalid character in isbn" do
    refute ISBNVerifier.isbn?("3-598-2K507-0")
  end

  @tag :pending
  test "X is only valid as a check digit" do
    refute ISBNVerifier.isbn?("3-598-2X507-0")
  end

  @tag :pending
  test "valid isbn without separating dashes" do
    assert ISBNVerifier.isbn?("3598215088")
  end

  @tag :pending
  test "isbn without separating dashes and X as check digit" do
    assert ISBNVerifier.isbn?("359821507X")
  end

  @tag :pending
  test "isbn without check digit and dashes" do
    refute ISBNVerifier.isbn?("359821507")
  end

  @tag :pending
  test "too long isbn and no dashes" do
    refute ISBNVerifier.isbn?("3598215078X")
  end

  @tag :pending
  test "isbn without check digit" do
    refute ISBNVerifier.isbn?("3-598-21507")
  end

  @tag :pending
  test "too long isbn" do
    refute ISBNVerifier.isbn?("3-598-21507-XA")
  end

  @tag :pending
  test "check digit of X should not be used for 0" do
    refute ISBNVerifier.isbn?("3-598-21515-X")
  end
end
