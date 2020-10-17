- Elixir is dynamically-typed
  - the type of a variable is only checked at run-time
- Using the match `=/2` operator, we can bind a value of any type to a variable name:
  - It is possible to re-bind variables
  - A variable may have any type of value bound to it.

## Modules

- Modules are the basis of code organization in Elixir.
  - A module is visible to all other modules.
  - A module is defined with [`defmodule`][defmodule].

## Named Functions

- All named functions must be defined in a module.

  - Named functions are defined with [`def`][def].
  - A named function may be made private from external modules by using [`defp`][defp] instead.
  - The value of the last line of a function is _implicitly returned_ after it is evaluated
  - Short functions may also be written using a one-line syntax.

  ```elixir
  def increment(n) do
    n + 1
  end

  defp private_increment(n) do
    n + 1
  end

  def short_increment(n), do: n + 1
  ```

- Functions are invoked using the full name of the function with the module name.
  - If invoked from within its own module, the module name may be omitted.
- The arity of a function is often used when referring to a named function

  - The arity refers to the number of parameters it accepts.

  ```elixir
  def add(x, y, z), do: x + y + z # add/3, because the arity is 3
  ```

## Integers

- Integer values are whole numbers written with one or more digits.
  - You may use underscores to separate large numbers.
  - Integers support the [basic mathematical operators][operators].

## Documentation

- Elixir provides 3 ways to write [inline documentation][inline-documentation].

  - Single line comments are preceded by `#`.
  - Functions may be documented with `@doc` preceding the named function definition

    ```elixir
    @doc """
    Function Documentation
    """
    def function(), do: true
    ```

  - Module may be documented with `@moduledoc` immediately following the module definition

    ```elixir
    defmodule Example do
      @moduledoc """
      Module documentation
      """

      #...
    end
    ```

[functional-programming]: https://en.wikipedia.org/wiki/Functional_programming
[match]: https://elixirschool.com/en/lessons/basics/pattern-matching/
[inline-documentation]: https://elixirschool.com/en/lessons/basics/documentation/#inline-documentation
[operators]: https://elixir-lang.org/getting-started/basic-types.html#basic-arithmetic
[modules]: https://elixirschool.com/en/lessons/basics/modules/#modules
[functions]: https://elixirschool.com/en/lessons/basics/functions/#named-functions
[def]: https://hexdocs.pm/elixir/Kernel.html#def/2
[defp]: https://hexdocs.pm/elixir/Kernel.html#defp/2
[defmodule]: https://hexdocs.pm/elixir/Kernel.html#defmodule/2
