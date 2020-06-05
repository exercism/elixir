defmodule FileSniffer do
  def type_from_extension(<< "bmp" >>), do: {:ok, "image/bmp"}
  def type_from_extension(<< "png" >>), do: {:ok, "image/png"}
  def type_from_extension(<< "jpg" >>), do: {:ok, "image/jpg"}
  def type_from_extension(<< "gif" >>), do: {:ok, "image/gif"}
  def type_from_extension(<< "exe" >>), do: {:ok, "application/octet-stream"}

  def type_from_binary(<< 0x42, 0x4D, _::binary >>), do: {:ok, "image/bmp"}
  def type_from_binary(<< 0x89, 0x50, 0x4E, 0x47, 0x0D, 0x0A, 0x1A, 0x0A, _::binary >>), do: {:ok, "image/png"}
  def type_from_binary(<< 0xFF, 0xD8, 0xFF, _::binary >>), do: {:ok, "image/jpg"}
  def type_from_binary(<< 0x47, 0x49, 0x46, _::binary >>), do: {:ok, "image/gif"}
  def type_from_binary(<< 0x7F, 0x45, 0x4C, 0x46, _::binary >>), do: {:ok, "application/octet-stream"}

  def verify(binary, extension) do
    {:ok, binary_type} = type_from_binary(binary)
    {:ok, extension_type} = type_from_extension(extension)

    if binary_type == extension_type do
      {:ok, binary_type}
    else
      {:error, "Warning, file format and file extension do not match."}
    end
  end
end
