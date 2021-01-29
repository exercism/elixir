defmodule MatchingBrackets do
  @brackets %{
    "{" => "}",
    "(" => ")",
    "[" => "]"
  }

  @doc """
  Check that all the brackets and braces in the string are matched correctly, and nested correctly
  """
  @spec check_brackets(String.t()) :: boolean
  def check_brackets(str) do
    str
    |> String.replace(~r/[^\{\}\[\]\(\)]/, "")
    |> String.codepoints()
    |> check([])
  end

  defp check([], []), do: true
  defp check([], _), do: false

  defp check([h | t], acc) do
    cond do
      Map.has_key?(@brackets, h) ->
        check(t, [Map.get(@brackets, h) | acc])

      Enum.empty?(acc) and !Map.has_key?(@brackets, h) ->
        false

      h != hd(acc) ->
        false

      h == hd(acc) ->
        check(t, tl(acc))

      true ->
        true
    end
  end
end
