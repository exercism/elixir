defmodule TakeANumberDeluxe.Queue do
  # You don't need to read this module to solve this exercise.

  # We would have used Erlang's queue module instead
  # (https://www.erlang.org/doc/man/queue.html),
  # but it lacks a `delete` function before OTP 24,
  # and we want this exercise to work on older versions too.

  defstruct in: [], out: []
  @type t :: %__MODULE__{}

  @spec new() :: t()
  def new(), do: %__MODULE__{}

  @spec push(t(), any()) :: t()
  def push(%__MODULE__{in: in_q} = q, a), do: %__MODULE__{q | in: [a | in_q]}

  @spec out(t()) :: {{:value, any()}, t()} | {:empty, t()}
  def out(%__MODULE__{in: [], out: []} = q), do: {:empty, q}
  def out(%__MODULE__{out: [head | tail]} = q), do: {{:value, head}, %__MODULE__{q | out: tail}}
  def out(%__MODULE__{in: in_q}), do: out(%__MODULE__{out: Enum.reverse(in_q)})

  @spec empty?(t()) :: boolean()
  def empty?(%__MODULE__{in: [], out: []}), do: true
  def empty?(%__MODULE__{}), do: false

  @spec member?(t(), any()) :: boolean()
  def member?(%__MODULE__{in: in_q, out: out}, a), do: a in in_q or a in out

  @spec delete(t(), any()) :: t()
  def delete(%__MODULE__{in: in_q, out: out}, a) do
    out = out ++ Enum.reverse(in_q)
    out = List.delete(out, a)
    %__MODULE__{out: out}
  end

  @spec from_list([any()]) :: t()
  def from_list(list), do: %__MODULE__{out: list}

  @spec to_list(t()) :: [any()]
  def to_list(%__MODULE__{in: in_q, out: out}), do: out ++ Enum.reverse(in_q)
end
