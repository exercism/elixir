if !System.get_env("EXERCISM_TEST_EXAMPLES") do
  Code.load_file("dna.exs")
end

ExUnit.start
ExUnit.configure exclude: :pending, trace: true

defmodule DNATest do
  use ExUnit.Case

  # @tag :pending
  test "empty dna string has no adenosine" do
    assert DNA.count('', ?A) == 0
  end

  @tag :pending
  test "repetitive cytidine gets counted" do
    assert DNA.count('CCCCC', ?C) == 5
  end

  @tag :pending
  test "counts only thymidine" do
    assert DNA.count('GGGGGTAACCCGG', ?T) == 1
  end

  @tag :pending
  test "empty dna string has no nucleotides" do
    expected = %{?A => 0, ?T => 0, ?C => 0, ?G => 0}
    assert DNA.histogram('') == expected
  end

  @tag :pending
  test "repetitive sequence has only guanosine" do
    expected = %{?A => 0, ?T => 0, ?C => 0, ?G => 8}
    assert DNA.histogram('GGGGGGGG') == expected
  end

  @tag :pending
  test "counts all nucleotides" do
    s = 'AGCTTTTCATTCTGACTGCAACGGGCAATATGTCTCTGTGTGGATTAAAAAAAGAGTGTCTGATAGCAGC'
    expected = %{?A => 20, ?T => 21, ?C => 12, ?G => 17}
    assert DNA.histogram(s) == expected
  end

  @tag :pending
  test "histogram validates the strand" do
    assert_raise ArgumentError, fn ->
      DNA.histogram('JOHNNYAPPLESEED')
    end
  end

  @tag :pending
  test "count validates the nucleotide" do
    assert_raise ArgumentError, fn ->
      DNA.count('', ?U)
    end
  end

  @tag :pending
  test "count validates the strand" do
    assert_raise ArgumentError, fn ->
      DNA.count('JOHNNYAPPLESEED', ?A)
    end
  end
end
