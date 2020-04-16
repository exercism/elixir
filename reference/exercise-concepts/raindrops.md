# Concepts for raindrops:

## Approaches

### procedural-ish

```elixir
defmodule Raindrops do
  @spec convert(int()) :: String.t()
  def convert(number),
    do: output({[sound(number, 3), sound(number, 5), sound(number, 7)], number})

  @spec sound(int(), int()) :: String.t()
  defp sound(n, 3) when rem(n, 3) == 0, do: "Pling"
  defp sound(n, 5) when rem(n, 5) == 0, do: "Plang"
  defp sound(n, 7) when rem(n, 7) == 0, do: "Plong"
  defp sound(_, _), do: ""

  @spec output({list(String.t()), int()}) :: String.t()
  defp output({["", "", ""], number}), do: "#{number}"
  defp output({sounds, _}), do: Enum.join(sounds)
end
```

### list comprehension

```elixir
defmodule Raindrops do
  def convert(number) do
    sounds = for f <- [3, 5, 7], s = sound(number, f), s != :no_sound, do: s
    output(sounds, number)
  end

  defp sound(n, 3) when rem(n, 3) == 0, do: "Pling"
  defp sound(n, 5) when rem(n, 5) == 0, do: "Plang"
  defp sound(n, 7) when rem(n, 7) == 0, do: "Plong"
  defp sound(_, _), do: :no_sound


  defp output([], number), do: "#{number}"
  defp output(sounds, _), do: Enum.join(sounds)
end
```

### recursive

This could also be an Enum.map or Enum.reduce solution

```elixir
defmodule Raindrops do
  @sounds [3, 5, 7]

  def convert(number) do
    @sounds
    |> do_convert(number)
    |> output(number)
  end

  defp do_convert([], _), do: []
  defp do_convert([f | t], n) do
    case sound(n, f) do
      s when is_bitstring(s) -> [s | do_convert(t, n)]
      :no_sound -> do_convert(t, n)
    end
  end

  defp sound(n, 3) when rem(n, 3) == 0, do: "Pling"
  defp sound(n, 5) when rem(n, 5) == 0, do: "Plang"
  defp sound(n, 7) when rem(n, 7) == 0, do: "Plong"
  defp sound(_, _), do: :no_sound

  defp output([], number), do: "#{number}"
  defp output(sounds, _), do: Enum.join(sounds)
end
```

## List of concepts

- approaches
  - recursion
  - procedural-ish
  - list comprehension
- naming
- modules
- named functions
  - one line syntax
  - multiline syntax
- pattern matching
  - on function signature
- guards
  - when
- types
  - integer
  - string
    - string interpolation
  - boolean
  - lists
    - literal forms
  - tuples
- syntax
  - nesting function calls
- standard library modules
  - Kernel
    - rem/2
    - ==/2
  - Enum
    - join/2
- typespec
