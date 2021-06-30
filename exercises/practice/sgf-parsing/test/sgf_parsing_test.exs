defmodule SgfParsingTest do
  alias SgfParsing.Sgf
  use ExUnit.Case

  # @tag :pending
  test "empty input" do
    encoded = ""
    output = SgfParsing.parse(encoded)
    expected = {:error, "tree missing"}

    assert output == expected
  end

  @tag :pending
  test "tree with no nodes" do
    encoded = "()"
    output = SgfParsing.parse(encoded)
    expected = {:error, "tree with no nodes"}

    assert output == expected
  end

  @tag :pending
  test "node without tree" do
    encoded = ";"
    output = SgfParsing.parse(encoded)
    expected = {:error, "tree missing"}

    assert output == expected
  end

  @tag :pending
  test "node without properties" do
    encoded = "(;)"
    output = SgfParsing.parse(encoded)
    expected = {:ok, %Sgf{}}

    assert output == expected
  end

  @tag :pending
  test "single node tree" do
    encoded = "(;A[B])"
    output = SgfParsing.parse(encoded)
    expected = {:ok, %Sgf{properties: %{"A" => ["B"]}}}

    assert output == expected
  end

  @tag :pending
  test "multiple properties" do
    encoded = "(;A[b]C[d])"
    output = SgfParsing.parse(encoded)
    expected = {:ok, %Sgf{properties: %{"A" => ["b"], "C" => ["d"]}}}

    assert output == expected
  end

  @tag :pending
  test "properties without delimiter" do
    encoded = "(;A)"
    output = SgfParsing.parse(encoded)
    expected = {:error, "properties without delimiter"}

    assert output == expected
  end

  @tag :pending
  test "all lowercase property" do
    encoded = "(;a[b])"
    output = SgfParsing.parse(encoded)
    expected = {:error, "property must be in uppercase"}

    assert output == expected
  end

  @tag :pending
  test "upper and lowercase property" do
    encoded = "(;Aa[b])"
    output = SgfParsing.parse(encoded)
    expected = {:error, "property must be in uppercase"}

    assert output == expected
  end

  @tag :pending
  test "two nodes" do
    encoded = "(;A[B];B[C])"
    output = SgfParsing.parse(encoded)

    expected =
      {:ok, %Sgf{children: [%Sgf{properties: %{"B" => ["C"]}}], properties: %{"A" => ["B"]}}}

    assert output == expected
  end

  @tag :pending
  test "two child trees" do
    encoded = "(;A[B](;B[C])(;C[D]))"
    output = SgfParsing.parse(encoded)

    expected =
      {:ok,
       %Sgf{
         children: [
           %Sgf{properties: %{"B" => ["C"]}},
           %Sgf{properties: %{"C" => ["D"]}}
         ],
         properties: %{"A" => ["B"]}
       }}

    assert output == expected
  end

  @tag :pending
  test "multiple property values" do
    encoded = "(;A[b][c][d])"
    output = SgfParsing.parse(encoded)
    expected = {:ok, %Sgf{properties: %{"A" => ["b", "c", "d"]}}}

    assert output == expected
  end

  @tag :pending
  test "escaped property" do
    encoded = "(;A[\\]b\\nc\\nd\\t\\te \\n\\]])"
    output = SgfParsing.parse(encoded)
    expected = {:ok, %Sgf{properties: %{"A" => ["]b\nc\nd\t\te \n]"]}}}

    assert output == expected
  end
end
