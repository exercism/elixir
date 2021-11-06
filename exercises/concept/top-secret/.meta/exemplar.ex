defmodule TopSecret do
  def to_ast(string) do
    Code.string_to_quoted!(string)
  end

  def decode_secret_message_part({keyword, _, children} = ast, acc)
      when keyword in [:def, :defp] do
    {function_name, arguments} = get_function_name_and_arguments(children)

    arity = if arguments, do: length(arguments), else: 0

    message_part =
      function_name
      |> to_string()
      |> String.slice(0, arity)

    {ast, [message_part | acc]}
  end

  def decode_secret_message_part(ast, acc) do
    {ast, acc}
  end

  defp get_function_name_and_arguments([{:when, _, [{function_name, _, arguments} | _]} | _]) do
    {function_name, arguments}
  end

  defp get_function_name_and_arguments([{function_name, _, arguments} | _]) do
    {function_name, arguments}
  end

  def decode_secret_message(string) do
    ast = to_ast(string)
    {_, acc} = Macro.prewalk(ast, [], &decode_secret_message_part/2)

    acc
    |> Enum.reverse()
    |> Enum.join("")
  end
end
