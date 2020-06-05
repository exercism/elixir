defmodule BasketballWebsite do
  def extract_from_path(data, path) do
    paths = String.split(path, ".", trim: true)
    do_extract(data, paths)
  end

  defp do_extract(nil, _), do: nil
  defp do_extract(data, []), do: data
  defp do_extract(data, [path|next]) do
    do_extract(data[path], next)
  end

  def get_in_path(data, path) do
    paths = String.split(path, ".", trim: true)
    get_in(data, paths)
  end
end
