defmodule PalindromeProductsTest do
  use ExUnit.Case

  # @tag :pending
  test "smallest palindrome from single digit factors" do
    palindromes = PalindromeProducts.generate(9)
    assert palindromes |> Map.keys() |> Enum.sort() |> hd() == 1
    assert Enum.sort(palindromes[1]) == [[1, 1]]
  end

  @tag :pending
  test "largest palindrome from single digit factors" do
    palindromes = PalindromeProducts.generate(9)
    assert palindromes |> Map.keys() |> Enum.sort() |> List.last() == 9
    assert Enum.sort(palindromes[9]) == [[1, 9], [3, 3]]
  end

  @tag :pending
  test "smallest palindrome from double digit factors" do
    palindromes = PalindromeProducts.generate(99, 10)
    assert palindromes |> Map.keys() |> Enum.sort() |> hd == 121
    assert palindromes[121] == [[11, 11]]
  end

  @tag :pending
  test "largest palindrome from double digit factors" do
    palindromes = PalindromeProducts.generate(99, 10)
    assert palindromes |> Map.keys() |> Enum.sort() |> List.last() == 9009
    assert palindromes[9009] == [[91, 99]]
  end

  @tag :pending
  test "smallest palindrome from triple digit factors" do
    palindromes = PalindromeProducts.generate(999, 100)
    assert palindromes |> Map.keys() |> Enum.sort() |> hd == 10201
    assert palindromes[10201] == [[101, 101]]
  end

  @tag :pending
  test "largest palindrome from triple digit factors" do
    palindromes = PalindromeProducts.generate(999, 100)
    assert palindromes |> Map.keys() |> Enum.sort() |> List.last() == 906_609
    assert palindromes[906_609] == [[913, 993]]
  end

  @tag :pending
  @tag :slow
  test "smallest palindrome from four digit factors" do
    palindromes = PalindromeProducts.generate(9999, 1000)
    assert palindromes |> Map.keys() |> Enum.sort() |> hd == 1_002_001
    assert palindromes[1_002_001] == [[1001, 1001]]
  end

  @tag :pending
  @tag :slow
  test "largest palindrome from four digit factors" do
    palindromes = PalindromeProducts.generate(9999, 1000)
    assert palindromes |> Map.keys() |> Enum.sort() |> List.last() == 99_000_099
    assert palindromes[99_000_099] == [[9901, 9999]]
  end

  @tag :pending
  test "empty result if no palindrome in the range" do
    palindromes = PalindromeProducts.generate(1003, 1002)
    assert palindromes == %{}
  end

  @tag :pending
  test "empty result if no palindrome in the range, smaller range" do
    palindromes = PalindromeProducts.generate(15, 15)
    assert palindromes == %{}
  end

  @tag :pending
  test "raises argument error if max < min" do
    assert_raise ArgumentError, fn ->
      PalindromeProducts.generate(1, 10000)
    end
  end
end
