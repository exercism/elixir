defmodule IsbnVerifierTest do
  use ExUnit.Case

  # @tag :pending
  test "valid isbn number" do
    assert IsbnVerifier.isbn?("3-598-21508-8")
  end

  @tag :pending
  test "invalid isbn check digit" do
    refute IsbnVerifier.isbn?("3-598-21508-9")
  end

  @tag :pending
  test "valid isbn number with a check digit of 10" do
    assert IsbnVerifier.isbn?("3-598-21507-X")
  end

  @tag :pending
  test "check digit is a character other than X" do
    refute IsbnVerifier.isbn?("3-598-21507-A")
  end

  @tag :pending
  test "invalid character in isbn" do
    refute IsbnVerifier.isbn?("3-598-2K507-0")
  end

  @tag :pending
  test "X is only valid as a check digit" do
    refute IsbnVerifier.isbn?("3-598-2X507-0")
  end

  @tag :pending
  test "valid isbn without separating dashes" do
    assert IsbnVerifier.isbn?("3598215088")
  end

  @tag :pending
  test "isbn without separating dashes and X as check digit" do
    assert IsbnVerifier.isbn?("359821507X")
  end

  @tag :pending
  test "isbn without check digit and dashes" do
    refute IsbnVerifier.isbn?("359821507")
  end

  @tag :pending
  test "too long isbn and no dashes" do
    refute IsbnVerifier.isbn?("3598215078X")
  end

  @tag :pending
  test "isbn without check digit" do
    refute IsbnVerifier.isbn?("3-598-21507")
  end

  @tag :pending
  test "too long isbn" do
    refute IsbnVerifier.isbn?("3-598-21507-XA")
  end

  @tag :pending
  test "check digit of X should not be used for 0" do
    refute IsbnVerifier.isbn?("3-598-21515-X")
  end

  # Test cases from international ISBN to test variable dash placement
  # Adapted from https://en.wikipedia.org/wiki/International_Standard_Book_Number#Registrant_element

  @tag :pending
  test "Qatar	NCCAH, Doha" do
    assert IsbnVerifier.isbn?("99921-58-10-7")
  end

  @tag :pending
  test "Singapore	World Scientific" do
    assert IsbnVerifier.isbn?("9971-5-0210-0")
  end

  @tag :pending
  test "Greece	Sigma Publications" do
    assert IsbnVerifier.isbn?("960-425-059-0")
  end

  @tag :pending
  test "Czech Republic; Slovakia	Taita Publishers" do
    assert IsbnVerifier.isbn?("80-902734-1-6")
  end

  @tag :pending
  test "Brazil	Companhia das Letras" do
    assert IsbnVerifier.isbn?("85-359-0277-5")
  end

  @tag :pending
  test "English-speaking area	Simon Wallenberg Press" do
    assert IsbnVerifier.isbn?("1-84356-028-3")
  end

  @tag :pending
  test "English-speaking area	Scribner" do
    assert IsbnVerifier.isbn?("0-684-84328-5")
  end

  @tag :pending
  test "English-speaking area	Frederick Ungar" do
    assert IsbnVerifier.isbn?("0-8044-2957-X")
  end

  @tag :pending
  test "English-speaking area	J. A. Allen & Co." do
    assert IsbnVerifier.isbn?("0-85131-041-9")
  end

  @tag :pending
  test "English-speaking area	Edupedia Publications Pvt Ltd." do
    assert IsbnVerifier.isbn?("93-86954-21-4")
  end

  @tag :pending
  test "English-speaking area	Willmann–Bell" do
    assert IsbnVerifier.isbn?("0-943396-04-2")
  end

  @tag :pending
  test "English-speaking area	KT Publishing" do
    assert IsbnVerifier.isbn?("0-9752298-0-X")
  end
end
