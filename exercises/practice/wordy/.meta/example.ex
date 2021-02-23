defmodule Wordy do
  @doc """
  Calculate the math problem in the sentence.
  """
  @spec answer(String.t()) :: integer
  def answer("What is " <> operation) do
    operation
    |> String.replace(["by", "?"], "")
    |> String.split()
    |> Enum.reduce([], fn
      x, ["multiplied", n | t] ->
        [n * to_i(x), t]

      x, ["divided", n | t] ->
        [div(n, to_i(x)), t]

      x, ["plus", n | t] ->
        [n + to_i(x), t]

      x, ["minus", n | t] ->
        [n - to_i(x), t]

      x, acc ->
        case Integer.parse(x) do
          {n, ""} -> [n | acc]
          :error -> [x | acc]
        end
    end)
    |> case do
      [n] when is_integer(n) -> n
      [n, _] when is_integer(n) -> n
      _ -> raise ArgumentError
    end
  end

  def answer(_), do: raise(ArgumentError)

  defdelegate to_i(list), to: String, as: :to_integer
end
