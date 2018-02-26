defmodule Markdown do
  @bold_md "__"
  @header_md "#"
  @italic_md "_"
  @list_md "*"

  @bold_open_tag "<strong>"
  @bold_close_tag "</strong>"
  @italic_open_tag "<em>"
  @italic_close_tag "</em>"
  @unordered_list_open_tag "<ul>"
  @unordered_list_close_tag "</ul>"
  @list_item_open_tag "<li>"
  @list_item_close_tag "</li>"
  @paragraph_open_tag "<p>"
  @paragraph_close_tag "</p>"
  @header_partial_open_tag "<h"
  @header_partial_close_tag "</h"

  def parse(markdown) do
    String.split(markdown, "\n") |> parse_line
  end

  defp parse_line(markdown_split_by_newline) do
    Enum.map_join(markdown_split_by_newline, fn text_with_md -> process_md(text_with_md) end)
    |> patch_line_with_unordered_list_tag
  end

  defp process_md(text_with_md) do
    cond do
      String.starts_with?(text_with_md, @header_md) ->
        parse_header_md_level(text_with_md) |> enclose_with_header_tag

      String.starts_with?(text_with_md, @list_md) ->
        parse_list_md_level(text_with_md)

      true ->
        String.split(text_with_md) |> enclose_with_paragraph_tag
    end
  end

  defp parse_header_md_level(header_md_with_text) do
    [header_md | header_text] = String.split(header_md_with_text)
    {to_string(String.length(header_md)), Enum.join(header_text, " ")}
  end

  defp parse_list_md_level(list_md_with_text) do
    list_text = String.trim_leading(list_md_with_text, "* ") |> String.split()
    @list_item_open_tag <> join_words_with_tags(list_text) <> @list_item_close_tag
  end

  defp enclose_with_header_tag({header_level, header_text_line}) do
    @header_partial_open_tag <>
      header_level <> ">" <> header_text_line <> @header_partial_close_tag <> header_level <> ">"
  end

  defp enclose_with_paragraph_tag(text_with_md) do
    @paragraph_open_tag <> join_words_with_tags(text_with_md) <> @paragraph_close_tag
  end

  defp join_words_with_tags(text_with_md) do
    Enum.map_join(text_with_md, " ", fn word_with_md -> replace_md_with_tag(word_with_md) end)
  end

  defp replace_md_with_tag(word_with_md) do
    replace_prefix_md(word_with_md) |> replace_suffix_md
  end

  defp replace_prefix_md(word_with_md) do
    cond do
      word_with_md =~ ~r/^[#{@italic_md}{1}][^#{@italic_md}+]/ ->
        String.replace_prefix(word_with_md, @italic_md, @italic_open_tag)

      word_with_md =~ ~r/^#{@bold_md}{1}/ ->
        String.replace_prefix(word_with_md, @bold_md, @bold_open_tag)

      true ->
        word_with_md
    end
  end

  defp replace_suffix_md(word_with_md) do
    cond do
      word_with_md =~ ~r/[^#{@italic_md}{1}][#{@italic_md}{1}]$/ ->
        String.replace_suffix(word_with_md, @italic_md, @italic_close_tag)

      word_with_md =~ ~r/#{@bold_md}{1}$/ ->
        String.replace_suffix(word_with_md, @bold_md, @bold_close_tag)

      true ->
        word_with_md
    end
  end

  defp patch_line_with_unordered_list_tag(html_line) do
    String.replace(
      html_line,
      @list_item_open_tag,
      @unordered_list_open_tag <> @list_item_open_tag,
      global: false
    )
    |> String.replace_suffix(
      @list_item_close_tag,
      @list_item_close_tag <> @unordered_list_close_tag
    )
  end
end
