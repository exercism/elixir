defmodule VariableLengthQuantityTest do
  use ExUnit.Case

  describe "Encode a series of integers, producing a series of bytes." do
    # @tag :pending
    test "zero" do
      integers = [0x0]
      output = VariableLengthQuantity.encode(integers)
      expected = <<0x0>>

      assert output == expected
    end

    @tag :pending
    test "arbitrary single byte" do
      integers = [0x40]
      output = VariableLengthQuantity.encode(integers)
      expected = <<0x40>>

      assert output == expected
    end

    @tag :pending
    test "largest single byte" do
      integers = [0x7F]
      output = VariableLengthQuantity.encode(integers)
      expected = <<0x7F>>

      assert output == expected
    end

    @tag :pending
    test "smallest double byte" do
      integers = [0x80]
      output = VariableLengthQuantity.encode(integers)
      expected = <<0x81, 0x0>>

      assert output == expected
    end

    @tag :pending
    test "arbitrary double byte" do
      integers = [0x2000]
      output = VariableLengthQuantity.encode(integers)
      expected = <<0xC0, 0x0>>

      assert output == expected
    end

    @tag :pending
    test "largest double byte" do
      integers = [0x3FFF]
      output = VariableLengthQuantity.encode(integers)
      expected = <<0xFF, 0x7F>>

      assert output == expected
    end

    @tag :pending
    test "smallest triple byte" do
      integers = [0x4000]
      output = VariableLengthQuantity.encode(integers)
      expected = <<0x81, 0x80, 0x0>>

      assert output == expected
    end

    @tag :pending
    test "arbitrary triple byte" do
      integers = [0x100000]
      output = VariableLengthQuantity.encode(integers)
      expected = <<0xC0, 0x80, 0x0>>

      assert output == expected
    end

    @tag :pending
    test "largest triple byte" do
      integers = [0x1FFFFF]
      output = VariableLengthQuantity.encode(integers)
      expected = <<0xFF, 0xFF, 0x7F>>

      assert output == expected
    end

    @tag :pending
    test "smallest quadruple byte" do
      integers = [0x200000]
      output = VariableLengthQuantity.encode(integers)
      expected = <<0x81, 0x80, 0x80, 0x0>>

      assert output == expected
    end

    @tag :pending
    test "arbitrary quadruple byte" do
      integers = [0x8000000]
      output = VariableLengthQuantity.encode(integers)
      expected = <<0xC0, 0x80, 0x80, 0x0>>

      assert output == expected
    end

    @tag :pending
    test "largest quadruple byte" do
      integers = [0xFFFFFFF]
      output = VariableLengthQuantity.encode(integers)
      expected = <<0xFF, 0xFF, 0xFF, 0x7F>>

      assert output == expected
    end

    @tag :pending
    test "smallest quintuple byte" do
      integers = [0x10000000]
      output = VariableLengthQuantity.encode(integers)
      expected = <<0x81, 0x80, 0x80, 0x80, 0x0>>

      assert output == expected
    end

    @tag :pending
    test "arbitrary quintuple byte" do
      integers = [0xFF000000]
      output = VariableLengthQuantity.encode(integers)
      expected = <<0x8F, 0xF8, 0x80, 0x80, 0x0>>

      assert output == expected
    end

    @tag :pending
    test "maximum 32-bit integer input" do
      integers = [0xFFFFFFFF]
      output = VariableLengthQuantity.encode(integers)
      expected = <<0x8F, 0xFF, 0xFF, 0xFF, 0x7F>>

      assert output == expected
    end

    @tag :pending
    test "two single-byte values" do
      integers = [0x40, 0x7F]
      output = VariableLengthQuantity.encode(integers)
      expected = <<0x40, 0x7F>>

      assert output == expected
    end

    @tag :pending
    test "two multi-byte values" do
      integers = [0x4000, 0x123456]
      output = VariableLengthQuantity.encode(integers)
      expected = <<0x81, 0x80, 0x0, 0xC8, 0xE8, 0x56>>

      assert output == expected
    end

    @tag :pending
    test "many multi-byte values" do
      integers = [0x2000, 0x123456, 0xFFFFFFF, 0x0, 0x3FFF, 0x4000]
      output = VariableLengthQuantity.encode(integers)

      expected = <<
        0xC0,
        0x0,
        0xC8,
        0xE8,
        0x56,
        0xFF,
        0xFF,
        0xFF,
        0x7F,
        0x0,
        0xFF,
        0x7F,
        0x81,
        0x80,
        0x0
      >>

      assert output == expected
    end
  end

  describe "Decode a series of bytes, producing a series of integers." do
    @tag :pending
    test "one byte" do
      encoded = <<0x7F>>
      output = VariableLengthQuantity.decode(encoded)
      expected = {:ok, [0x7F]}

      assert output == expected
    end

    @tag :pending
    test "two bytes" do
      encoded = <<0xC0, 0x0>>
      output = VariableLengthQuantity.decode(encoded)
      expected = {:ok, [0x2000]}

      assert output == expected
    end

    @tag :pending
    test "three bytes" do
      encoded = <<0xFF, 0xFF, 0x7F>>
      output = VariableLengthQuantity.decode(encoded)
      expected = {:ok, [0x1FFFFF]}

      assert output == expected
    end

    @tag :pending
    test "four bytes" do
      encoded = <<0x81, 0x80, 0x80, 0x0>>
      output = VariableLengthQuantity.decode(encoded)
      expected = {:ok, [0x200000]}

      assert output == expected
    end

    @tag :pending
    test "maximum 32-bit integer" do
      encoded = <<0x8F, 0xFF, 0xFF, 0xFF, 0x7F>>
      output = VariableLengthQuantity.decode(encoded)
      expected = {:ok, [0xFFFFFFFF]}

      assert output == expected
    end

    @tag :pending
    test "incomplete sequence causes error" do
      encoded = <<0xFF>>
      output = VariableLengthQuantity.decode(encoded)
      expected = {:error, "incomplete sequence"}

      assert output == expected
    end

    @tag :pending
    test "incomplete sequence causes error, even if value is zero" do
      encoded = <<0x80>>
      output = VariableLengthQuantity.decode(encoded)
      expected = {:error, "incomplete sequence"}

      assert output == expected
    end

    @tag :pending
    test "multiple values" do
      encoded = <<
        0xC0,
        0x0,
        0xC8,
        0xE8,
        0x56,
        0xFF,
        0xFF,
        0xFF,
        0x7F,
        0x0,
        0xFF,
        0x7F,
        0x81,
        0x80,
        0x0
      >>

      output = VariableLengthQuantity.decode(encoded)
      expected = {:ok, [0x2000, 0x123456, 0xFFFFFFF, 0x0, 0x3FFF, 0x4000]}

      assert output == expected
    end
  end
end
