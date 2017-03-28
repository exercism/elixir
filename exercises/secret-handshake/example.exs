defmodule SecretHandshake do
  @codes %{
    1 => "wink",
    2 => "double blink",
    4 => "close your eyes",
    8 => "jump"
  }

  @doc """
  Determine the actions of a secret handshake based on the binary
  representation of the given `code`.

  If the following bits are set, include the corresponding action in your list
  of commands, in order from lowest to highest.

  1 = wink
  10 = double blink
  100 = close your eyes
  1000 = jump

  10000 = Reverse the order of the operations in the secret handshake
  """
  @spec commands(code :: integer) :: list(String.t())
  def commands(code) do
    do_commands(div(code, 2), rem(code, 2), 1, [])
  end

  def do_commands(_code, _set, 32, results), do: Enum.reverse(results)
  def do_commands(_code, 1, 16, results), do: results
  for {mult, result} <- @codes do
    def do_commands(code, 1, unquote(mult), results) do
      do_commands(div(code, 2), rem(code, 2), unquote(mult) * 2, [unquote(result) | results])
    end
  end
  def do_commands(code, 0, mult, results), do: do_commands(div(code, 2), rem(code, 2), mult * 2, results)
end

