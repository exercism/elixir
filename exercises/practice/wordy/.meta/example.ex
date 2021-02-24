defmodule Wordy do
  import String, only: [to_integer: 1]

  @type token() :: String.t() | integer()

  @doc """
  Calculate the math problem in the sentence.
  """
  @spec answer(String.t()) :: integer
  def answer(question) do
    question
    |> tokenize
    |> eval
  end

  @spec tokenize(String.t()) :: list(token())
  defp tokenize(question) do
    question
    |> String.trim_trailing("?")
    |> String.split()
  end

  @spec eval(list(token()), integer) :: integer
  defp eval(tokens, acc \\ 0) do
    case tokens do
      [] -> acc
      ["What", "is", n | rest] -> rest |> eval(to_integer(n))
      ["plus", n | rest] -> rest |> eval(acc + to_integer(n))
      ["minus", n | rest] -> rest |> eval(acc - to_integer(n))
      ["multiplied", "by", n | rest] -> rest |> eval(acc * to_integer(n))
      ["divided", "by", n | rest] -> rest |> eval(div(acc, to_integer(n)))
      _ -> raise(ArgumentError)
    end
  end
end
