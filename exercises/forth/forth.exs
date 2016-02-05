defmodule Forth do
  @opaque evaluator :: any
  
  @doc """
  Create a new evaluator.
  """
  @spec new() :: evaluator
  def new() do

  end

  @doc """
  Evaluate an input string, updating the evaluator state.
  """
  @spec eval(evaluator, String.t) :: evaluator
  def eval(ev, s) do
  
  end

  @doc """
  Return the current stack as a string with the element on top of the stack
  being the rightmost element in the string.
  """
  @spec format_stack(evaluator) :: String.t
  def format_stack(ev) do
  
  end

  defmodule StackUnderflow do
    defexception []
    def exception(_), do: "stack underflow"
  end

  defmodule InvalidWord do
    defexception [:word]
    def exception(e), do: "invalid word: #{inspect e.word}"
  end

  defmodule UnknownWord do
    defexception [:word]
    def exception(e), do: "unknown word: #{inspect e.word}"
  end

  defmodule DivisionByZero do
    defexception []
    def exception(_), do: "division by zero"
  end
end
