# Introduction

## `use`

The `use` macro allows us to quickly extend our module with functionally provided by another module. When we `use` a module, that module can inject code into our module - it can for example define functions, `import` or `alias` other modules, or set module attributes.

If you ever looked at the test files of some of the Elixir exercises here on Exercism, you most likely noticed that they all start with `use ExUnit.Case`. This single line of code is what makes the macros `test` and `assert` available in the test module.

```elixir
defmodule LasagnaTest do
  use ExUnit.Case

  test "expected minutes in oven" do
    assert Lasagna.expected_minutes_in_oven() === 40
  end
end
```

### `__using__/1` macro

What exactly happens when you `use` a module is dictated by that module's `__using__/1` macro. It takes one argument, a keyword list with options, and it returns a [quoted expression][concept-ast]. The code in this quoted expression is inserted into our module when calling `use`.

```elixir
defmodule ExUnit.Case do
  defmacro __using__(opts) do
    # some real-life ExUnit code omitted here
    quote do
      import ExUnit.Assertions
      import ExUnit.Case, only: [describe: 2, test: 1, test: 2, test: 3]
    end
  end
end
```

The options can be given as a second argument when calling `use`, e.g. `use ExUnit.Case, async: true`. When not given explicitly, they default to an empty list.

## Behaviours

### Default callback implementations

### Behaviours vs protocols

??

[concept-ast]: https://exercism.org/tracks/elixir/concepts/ast
