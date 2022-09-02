defmodule SecretHandshake do
  import Bitwise

  @codes ["wink", "double blink", "close your eyes", "jump"]

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
    @codes
    |> Enum.with_index()
    |> Enum.map(fn {command, i} -> {command, 2 <<< (i - 1)} end)
    |> decode_commands(code, [])
  end

  defp decode_commands([], code, results) do
    case flag_set(code, 16) do
      true -> results
      _ -> Enum.reverse(results)
    end
  end

  defp decode_commands([{command, flag} | flags], code, results) do
    case flag_set(code, flag) do
      true -> decode_commands(flags, code, [command | results])
      _ -> decode_commands(flags, code, results)
    end
  end

  defp flag_set(flags, flag_to_check), do: (flags &&& flag_to_check) == flag_to_check
end
