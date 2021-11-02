defmodule Forth do
  defp exec(word, st) when is_integer(word), do: [word | st]
  defp exec("+", [a, b | st]), do: [a + b | st]
  defp exec("+", _), do: raise(Forth.StackUnderflow)
  defp exec("-", [a, b | st]), do: [b - a | st]
  defp exec("-", _), do: raise(Forth.StackUnderflow)
  defp exec("*", [a, b | st]), do: [a * b | st]
  defp exec("*", _), do: raise(Forth.StackUnderflow)
  defp exec("/", [0, _ | _]), do: raise(Forth.DivisionByZero)
  defp exec("/", [a, b | st]), do: [div(b, a) | st]
  defp exec("/", _), do: raise(Forth.StackUnderflow)
  defp exec("DUP", [a | st]), do: [a, a | st]
  defp exec("DUP", _), do: raise(Forth.StackUnderflow)
  defp exec("DROP", [_ | st]), do: st
  defp exec("DROP", _), do: raise(Forth.StackUnderflow)
  defp exec("SWAP", [a, b | st]), do: [b, a | st]
  defp exec("SWAP", _), do: raise(Forth.StackUnderflow)
  defp exec("OVER", [a, b | st]), do: [b, a, b | st]
  defp exec("OVER", _), do: raise(Forth.StackUnderflow)
  defp exec(word, _), do: raise(Forth.UnknownWord, word: word)

  defmodule Evaluator do
    defstruct state: :start, cmddef: [], stack: [], words: %{}
  end

  @opaque evaluator :: %Evaluator{}

  @doc """
  Create a new evaluator.
  """
  @spec new() :: evaluator
  def new() do
    %Evaluator{}
  end

  @doc """
  Evaluate an input string, updating the evaluator state.
  """
  @spec eval(evaluator, String.t()) :: evaluator
  def eval(ev, s) do
    s
    |> split_words
    |> eval_words(ev)
  end

  defp eval_words(words, ev) do
    words |> Enum.reduce(ev, &eval_word/2)
  end

  defp eval_word(":", %Evaluator{state: :start} = ev) do
    %{ev | state: :defining_word, cmddef: []}
  end

  defp eval_word(word, %Evaluator{state: :start, stack: stack, words: words} = ev) do
    case Map.get(words, word) do
      nil -> %{ev | stack: exec(word, stack)}
      ts -> ts |> eval_words(ev)
    end
  end

  defp eval_word(";", %Evaluator{state: :defining_word, cmddef: cmddef} = ev) do
    [cmd | expansion] = cmddef |> Enum.reverse()
    define_word(ev, cmd, expansion)
  end

  defp eval_word(word, %Evaluator{state: :defining_word, cmddef: cmddef} = ev) do
    %{ev | cmddef: [word | cmddef]}
  end

  defp define_word(_ev, word, _expansion) when is_integer(word) do
    raise(Forth.InvalidWord, word: word)
  end

  defp define_word(%Evaluator{words: words} = ev, word, expansion) do
    expansion =
      expansion
      |> Enum.flat_map(fn t ->
        case Map.get(words, t) do
          nil -> [t]
          ts -> ts
        end
      end)

    %{ev | state: :start, words: Map.put(words, word, expansion)}
  end

  defp split_words(s) do
    s
    |> String.split(~r{([^[:print:]]|[[:space:]]| )}u)
    |> Enum.map(fn word ->
      case Integer.parse(word) do
        {i, ""} -> i
        _ -> String.upcase(word)
      end
    end)
  end

  @doc """
  Return the current stack as a string with the element on top of the stack
  being the rightmost element in the string.
  """
  @spec format_stack(evaluator) :: String.t()
  def format_stack(%Evaluator{stack: stack}) do
    stack
    |> Enum.reverse()
    |> Enum.map_join(" ", &Integer.to_string/1)
  end

  defmodule StackUnderflow do
    defexception []
    def message(_), do: "stack underflow"
  end

  defmodule InvalidWord do
    defexception word: nil
    def message(e), do: "invalid word: #{inspect(e.word)}"
  end

  defmodule UnknownWord do
    defexception word: nil
    def message(e), do: "unknown word: #{inspect(e.word)}"
  end

  defmodule DivisionByZero do
    defexception []
    def message(_), do: "division by zero"
  end
end
