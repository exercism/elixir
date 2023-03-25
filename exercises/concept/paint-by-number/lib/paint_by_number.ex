defmodule PaintByNumber do
  def palette_bit_size(color_count) do
    do_palette_bit_size(color_count)
  end

  defp do_palette_bit_size(color_count, bits \\ 1) do
    if Integer.pow(2, bits) >= color_count do
      bits
    else
      do_palette_bit_size(color_count, bits + 1)
    end
  end

  def empty_painting() do
    <<>>
  end

  def test_painting() do
    <<0::2, 1::2, 2::2, 3::2>>
  end

  def prepend_pixel(painting, color_count, pixel_color) do
    palette_size = palette_bit_size(color_count)

    <<pixel_color::size(palette_size), painting::bitstring>>
  end

  def get_first_pixel(painting, color_count) do
    palette_bit_size = palette_bit_size(color_count)

    case painting do
      <<>> -> nil
      <<pixel_color::size(palette_bit_size), _::bitstring>> -> pixel_color
    end
  end

  def drop_first_pixel(painting, palette_size) do
    palette_size = palette_bit_size(palette_size)

    case painting do
      <<>> -> <<>>
      <<_::size(palette_size), rest::bitstring>> -> rest
    end
  end
end
