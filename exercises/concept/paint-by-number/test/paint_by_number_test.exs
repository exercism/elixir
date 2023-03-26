defmodule PaintByNumberTest do
  use ExUnit.Case

  describe "palette_bit_size" do
    @tag task_id: 1
    test "needs 1 bit to encode two colors" do
      color_count = 2
      assert PaintByNumber.palette_bit_size(color_count) == 1
    end

    @tag task_id: 1
    test "needs 2 bits to encode three colors" do
      color_count = 3
      assert PaintByNumber.palette_bit_size(color_count) == 2
    end

    @tag task_id: 1
    test "needs 2 bits to encode four colors" do
      color_count = 4
      assert PaintByNumber.palette_bit_size(color_count) == 2
    end

    @tag task_id: 1
    test "needs 3 bits to encode seven colors" do
      color_count = 7
      assert PaintByNumber.palette_bit_size(color_count) == 3
    end

    @tag task_id: 1
    test "needs 3 bits to encode eight colors" do
      color_count = 8
      assert PaintByNumber.palette_bit_size(color_count) == 3
    end

    @tag task_id: 1
    test "needs 4 bits to encode nine colors" do
      color_count = 9
      assert PaintByNumber.palette_bit_size(color_count) == 4
    end

    @tag task_id: 1
    test "needs 4 bits to encode fourteen colors" do
      color_count = 14
      assert PaintByNumber.palette_bit_size(color_count) == 4
    end

    @tag task_id: 1
    test "needs 6 bits to encode fifty colors" do
      color_count = 50
      assert PaintByNumber.palette_bit_size(color_count) == 6
    end

    @tag task_id: 1
    test "needs 20 bits to encode 1 million colors" do
      color_count = 1_000_000
      assert PaintByNumber.palette_bit_size(color_count) == 20
    end
  end

  describe "empty_painting" do
    @tag task_id: 2
    test "returns an empty bitstring" do
      assert PaintByNumber.empty_painting() == <<>>
    end
  end

  describe "test_painting" do
    @tag task_id: 3
    test "returns the numbers 0, 1, 2, and 3 as fragments of size 2" do
      assert PaintByNumber.test_painting() == <<0::2, 1::2, 2::2, 3::2>>
    end
  end

  describe "prepend_pixel" do
    @tag task_id: 4
    test "works with an empty painting" do
      painting = <<>>
      color_count = 16
      pixel_color_index = 1
      assert PaintByNumber.prepend_pixel(painting, color_count, pixel_color_index) == <<1::4>>
    end

    @tag task_id: 4
    test "works with a non-empty painting" do
      painting = <<3::3, 2::3, 2::3>>
      color_count = 7
      pixel_color_index = 0

      assert PaintByNumber.prepend_pixel(painting, color_count, pixel_color_index) ==
               <<0::3, 3::3, 2::3, 2::3>>
    end

    @tag task_id: 4
    test "pixel color overflows if it doesn't fit in palette size" do
      painting = <<3::6>>
      color_count = 64
      pixel_color_index = 64

      assert PaintByNumber.prepend_pixel(painting, color_count, pixel_color_index) ==
               <<0::6, 3::6>>
    end
  end

  describe "get_first_pixel" do
    @tag task_id: 5
    test "returns nil if empty painting" do
      painting = <<>>
      color_count = 16
      assert PaintByNumber.get_first_pixel(painting, color_count) == nil
    end

    @tag task_id: 5
    test "works with a non-empty painting" do
      painting = <<1::2, 0::2, 0::2, 2::2>>
      color_count = 3
      assert PaintByNumber.get_first_pixel(painting, color_count) == 1
    end

    @tag task_id: 5
    test "can reinterpret painting data with a different color count" do
      painting = <<0b01::2, 0b10::2, 0b00::2, 0b10::2>>
      # Color count of 8 means 3 bits.
      color_count = 8
      # We take bits from segments until we have 3 bits.
      # First, we take `01` from the first segment. Then, `1` from the second segment.
      # This gives us the binary number `011`, which is equal to the decimal number 5.
      assert PaintByNumber.get_first_pixel(painting, color_count) == 0b011
    end
  end

  describe "drop_first_pixel" do
    @tag task_id: 6
    test "returns empty painting if empty painting" do
      painting = <<>>
      color_count = 5
      assert PaintByNumber.drop_first_pixel(painting, color_count) == <<>>
    end

    @tag task_id: 6
    test "works with a non-empty painting" do
      painting = <<23::5, 21::5, 15::5, 3::5>>
      color_count = 32
      assert PaintByNumber.drop_first_pixel(painting, color_count) == <<21::5, 15::5, 3::5>>
    end

    @tag task_id: 6
    test "can reinterpret painting data with a different color count" do
      painting = <<0b011011::6, 0b110001::6>>
      # Color count of 4 means 2 bits.
      color_count = 4
      # We remove the first 2 bits from the first segment.
      assert PaintByNumber.drop_first_pixel(painting, color_count) == <<0b1011::4, 0b110001::6>>
    end
  end
end
