defmodule PaintByNumber do
  def palette_bit_size(color_count) do
    do_palette_bit_size(color_count)
  end

  defp do_palette_bit_size(color_count, bits \\ 1) do
    if Math.pow(2, bits) >= color_count do
      bits
    else
      do_palette_bit_size(color_count, bits + 1)
    end
  end

  def empty_picture() do
    <<>>
  end

  def test_picture() do
    <<0::2, 1::2, 2::2, 3::2>>
  end

  def prepend_pixel(picture, color_count, pixel_color_index) do
    palette_bit_size = palette_bit_size(color_count)

    <<pixel_color_index::size(palette_bit_size), picture::bitstring>>
  end

  def get_first_pixel(picture, color_count) do
    palette_bit_size = palette_bit_size(color_count)

    case picture do
      <<>> -> nil
      <<pixel_color_index::size(palette_bit_size), _::bitstring>> -> pixel_color_index
    end
  end

  def drop_first_pixel(picture, color_count) do
    palette_bit_size = palette_bit_size(color_count)

    case picture do
      <<>> -> <<>>
      <<_::size(palette_bit_size), rest::bitstring>> -> rest
    end
  end

  def concat_pictures(picture1, picture2) do
    <<picture1::bitstring, picture2::bitstring>>
  end
end
