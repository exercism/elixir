# Introduction

## Use

The `use` macro allows us to quickly extend our module with functionality provided by another module. When we `use` a module, that module can inject code into our module - it can for example define functions, `import` or `alias` other modules, or set module attributes.

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

Behaviours allow us to define interfaces (sets of functions and macros) in a _behaviour module_ that can be later implemented by different _callback modules_. Thanks to the shared interface, those callback modules can be used interchangeably.

~~~~exercism/note
Note the British spelling of "behaviours".
~~~~

### Defining behaviours

To define a behaviour, we need to create a new module and specify a list of functions that are part of the desired interface. Each function needs to be defined using the `@callback` module attribute. The syntax is identical to a [function typespec][concept-typespecs] (`@spec`). We need to specify a function name, a list of argument types, and all the possible return types.

```elixir
defmodule Countable do
  @callback count(collection :: any) :: pos_integer
end
```

### Implementing behaviours

To add an existing behaviour to our module (create a callback module) we use the `@behaviour` module attribute. Its value should be the name of the behaviour module that we're adding.

Then, we need to define all the functions (callbacks) that are required by that behaviour module. If we're implementing somebody else's behaviour, like Elixir's built-in `Access` or `GenServer` behaviours, we would find the list of all the behaviour's callbacks in the documentation on [hexdocs.pm][hexdocs].

A callback module is not limited to implementing only the functions that are part of its behaviour. It is also possible for a single module to implement multiple behaviours.

To mark which function comes from which behaviour, we should use the module attribute `@impl` before each function. Its value should be the name of the behaviour module that defines this callback.

```elixir
defmodule BookCollection do
  @behaviour Countable

  defstruct [:list, :owner]

  @impl Countable
  def count(collection) do
    Enum.count(collection.list)
  end

  def mark_as_read(collection, book) do
    # other function unrelated to the Countable behaviour
  end
end
```

### Default callback implementations

When defining a behaviour, it is possible to provide a default implementation of a callback. This implementation should be defined in the quoted expression of the `__using__/1` macro. To make it possible for users of the behaviour module to override the default implementation, call the `defoverridable/1` macro after the function implementation. It accepts a keyword list of function names as keys and function arities as values.

```elixir
defmodule Countable do
  @callback count(collection :: any) :: pos_integer

  defmacro __using__(_) do
    quote do
      @behaviour Countable
      def count(collection), do: Enum.count(collection)
      defoverridable count: 1
    end
  end
end
```

Note that defining functions inside of `__using__/1` is discouraged for any other purpose than defining default callback implementations, but you can always define functions in another module and import them in the `__using__/1` macro.

[concept-ast]: https://exercism.org/tracks/elixir/concepts/ast
[concept-typespecs]: https://exercism.org/tracks/elixir/concepts/typespecs
[hexdocs]: https://hexdocs.pm
