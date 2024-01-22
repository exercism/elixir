# Representer normalizations

The [Elixir representer][representer] applies a number of normalizations.
Please refer to the code or the [test data][test-data] for details.

## Remove comments and docs

All comments, docs, moduledocs and typedocs are removed.

### Before

```elixir
defmodule Fake do
  @moduledoc """
  Fake module to demonstrate stuff
  """

  @doc "Not much to see here"
  def foo do
    # TODO: return bar
    nil
  end
end
```

### After

```elixir
defmodule Fake do
  def foo do
    nil
  end
end
```

## Sort imports order

The import statements at the top of the modules or functions are ordered as: `alias`, `use`, `require`, `import`.

### Before

```elixir
defmodule Fake do
  import D
  alias A.U.V
  use B
  alias A.{T, S}
  require C

  def foo do
    import Z
    alias X
    use Y
  end

  import NotTouched
  alias NotTouched
end
```

### After

```elixir
defmodule Fake do
  alias A.{S, T}
  alias A.U.V
  use B
  require C
  import D

  def foo do
    alias X
    use Y
    import Z
  end

  import NotTouched
  alias NotTouched
end
```

## Format code

The code is formatted using [mix code][mix-code], forcing `do` `end` blocks.
All functions in pipes are written with parentheses.
Types are written without.

### Before

[]: # (elixir-formatter-disable-next-block)

```elixir
defmodule    Fake   do
        @type foo() :: integer() | atom
def foo, do:    nil |> bar
end
```

### After

```elixir
defmodule Fake do
  @type foo() :: integer | atom
  def foo do
    nil |> bar()
  end
end
```

## Normalize identifiers

Identifiers are normalized to a placeholder value.
Some special variables and module attributes (`_`, `@spec`, `__MODULE__`, etc.) are not replaced.
Keys from maps, structs and keyword lists are not normalized.

### Before

```elixir
defmodule Fake do
  alias Fake, as: SuperFake
  @my_constant 42

  @impl true
  def foo(bar) when is_integer(bar) do
    bar + @my_constant
  end

  def foo(%{a: a} = bar) do
    %{bar | a: a + @my_constant}
  end

  def foo(_), do: nil
end
```

### After

```elixir
defmodule Placeholder_1 do
  alias Placeholder_1, as: Placeholder_2
  @placeholder_6 42
  @impl true
  def placeholder_4(placeholder_5) when is_integer(placeholder_5) do
    placeholder_5 + @placeholder_6
  end

  def placeholder_4(%{a: placeholder_7} = placeholder_5) do
    %{placeholder_5 | a: placeholder_7 + @placeholder_6}
  end

  def placeholder_4(_) do
    nil
  end
end
```

## Sort keys in maps and structs

Keys in maps and structs are sorted.
Keys in keyword lists are not sorted.

### Before

```elixir
defmodule Fake do
  def foo do
    %MyStruct{z: 3, y: 2, x: 1}
    m = %{c: 3, a: 1, b: 2}
    %{m | b: 20, a: 10}
    [b: 2, a: 1]
  end
end
```

### After

```elixir
defmodule Fake do
  def foo do
    %MyStruct{x: 1, y: 2, z: 3}
    placeholder_3 = %{a: 1, b: 2, c: 3}
    %{placeholder_3 | a: 10, b: 20}
    [b: 2, a: 1]
  end
end
```

[representer]: https://github.com/exercism/elixir-representer
[test-data]: https://github.com/exercism/elixir-representer/tree/main/test_data
[mix-format]: https://hexdocs.pm/mix/main/Mix.Tasks.Format.html

