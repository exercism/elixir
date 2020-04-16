# Concepts for secret-handshake

## Optimal solution

```elixir
defmodule SecretHandshake do
  use Bitwise

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
    []
    |> do_commands(0x08 == (code &&& 0x08), "jump")
    |> do_commands(0x04 == (code &&& 0x04), "close your eyes")
    |> do_commands(0x02 == (code &&& 0x02), "double blink")
    |> do_commands(0x01 == (code &&& 0x01), "wink")
    |> do_commands(0x10 == (code &&& 0x10), &Enum.reverse/1)
  end

  defp do_commands(acc, do?, todo)
  defp do_commands(acc, false, _), do: acc
  defp do_commands(acc, true, str) when is_binary(str), do: [str | acc]
  defp do_commands(acc, true, fun), do: fun.(acc)
end
```

## Concepts

- Bitwise manipulation
  - a simple way to check if a bit is set is with a binary and (`Bitwise.band/2` or `&&&`)
- Conditionals
  - depending on if a bit it set, certain actions will be applied
- Functions
  - the returned list will be reversed if a certain bit is set (use `Enum.reverse/1`)
- Immutability
  - a list must be built up without mutation
- Lists
  - the return value is a list, which should be built up without repeated use of `++`
- Operators
  - if we `use Bitwise`, `&&&` may be used like an operator
- Pattern matching
  - pattern matching may be used to implement conditional logic
