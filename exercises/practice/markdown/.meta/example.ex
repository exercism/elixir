defmodule Markdown do
  @doc """
    Parses a given string with Markdown syntax and returns the associated HTML for that string.

    ## Examples

      iex> Markdown.parse("This is a paragraph")
      "<p>This is a paragraph</p>"

      iex> Markdown.parse("# Header!\\n* __Bold Item__\\n* _Italic Item_")
      "<h1>Header!</h1><ul><li><strong>Bold Item</strong></li><li><em>Italic Item</em></li></ul>"
  """
  @spec parse(String.t()) :: String.t()
  def parse(m) do
    m
    |> String.split("\n")
    |> Enum.map_join("", &process/1)
    |> patch()
  end

  defp process(t = "#" <> _) do
    [h, tail] = String.split(t, " ", parts: 2)

    if byte_size(h) < 7 do
      wrap_in_html_tag(tail, "h#{byte_size(h)}")
    else
      wrap_in_html_tag(t, "p")
    end
  end

  defp process("*" <> t) do
    t
    |> String.trim()
    |> wrap_in_html_tag("li")
  end

  defp process(t), do: wrap_in_html_tag(t, "p")

  defp wrap_in_html_tag(s, tag) do
    "<#{tag}>#{replace_md_tags(s)}</#{tag}>"
  end

  defp replace_md_tags(line) do
    line
    |> String.replace(~r/__(.+)__/U, "<strong>\\1</strong>")
    |> String.replace(~r/_(.+)_/U, "<em>\\1</em>")
  end

  defp patch(l) do
    l
    |> String.replace("<li>", "<ul><li>", global: false)
    |> String.replace(~r/(<\/li>)(?!.*\1)/, "</li></ul>")
  end
end
