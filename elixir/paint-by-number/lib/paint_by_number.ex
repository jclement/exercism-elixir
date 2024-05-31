defmodule PaintByNumber do
  def palette_bit_size(color_count) do
    palette_bit_size(1, color_count)
  end

  defp palette_bit_size(bits, color_count) do
    if Integer.pow(2, bits) >= color_count do
      bits
    else
      palette_bit_size(bits + 1, color_count)
    end
  end

  def empty_picture() do
    <<>>
  end

  def test_picture() do
    <<0::2, 1::2, 2::2, 3::2>>
  end

  def prepend_pixel(picture, color_count, pixel_color_index) do
    s = palette_bit_size(color_count)
    <<pixel_color_index::size(s), picture::bitstring>>
  end

  def get_first_pixel(<<>>, _color_count), do: nil

  def get_first_pixel(picture, color_count) do
    s = palette_bit_size(color_count)
    <<pixel::size(s), _::bitstring>> = picture
    pixel
  end

  def drop_first_pixel(<<>>, _color_count), do: <<>>

  def drop_first_pixel(picture, color_count) do
    s = palette_bit_size(color_count)
    <<_::size(s), rest::bitstring>> = picture
    rest
  end

  def concat_pictures(picture1, picture2) do
    <<picture1::bitstring, picture2::bitstring>>
  end
end
