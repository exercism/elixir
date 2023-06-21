# About

[Guards][guards] are used as a complement to [pattern matching][exercism-pattern-matching]. They allow for more complex checks. They can be used in [some, but not all situations][where-guards-can-be-used] where pattern matching can be used, for example in function clauses or case clauses.

```elixir
def empty?(list) when is_list(list) and length(list) == 0 do
  true
end
```

- Guards begin with the `when` keyword, followed by a boolean expression.
- Guard expressions are special functions which:
  - Must be [pure][pure-function] and not mutate any global states.
  - Must return strict `true` or `false` values.
- A list of common guards are found in the [Elixir documentation][kernel-guards]. They include:
  - Type checks: [`is_integer/1`][guard-is-integer], [`is_list/1`][guard-is-list], [`is_nil/1`][guard-is-nil] etc.
  - Arithmetic operators: [`+/2`][guard-plus], [`-/2`][guard-minus] etc.
  - Comparisons: [`==/2`][guard-equals], [`>/2`][guard-greater], [`</2`][guard-less] etc.
  - Boolean operators: [`and/2`][guard-and], [`or/2`][guard-or], [`not/1`][guard-not]
  - Membership operator: [`in/2`][guard-in]
- You can define your own guard with [`defguard`][defguard].

  - According to Elixir's [naming convention][naming], guard names should start with `is_`.

    ```elixir
    defmodule HTTP do
      defguard is_success(code) when code >= 200 and code < 300

      def handle_response(code) when is_success(code) do
        :ok
      end
    end
    ```

[guards]: https://hexdocs.pm/elixir/patterns-and-guards.html#guards
[kernel-guards]: https://hexdocs.pm/elixir/Kernel.html#guards
[pure-function]: https://gist.github.com/tomekowal/16cb4192b73fe9222de9fd09e653c03e
[guard-is-integer]: https://hexdocs.pm/elixir/Kernel.html#is_integer/1
[guard-is-list]: https://hexdocs.pm/elixir/Kernel.html#is_list/1
[guard-is-nil]: https://hexdocs.pm/elixir/Kernel.html#is_nil/1
[guard-plus]: https://hexdocs.pm/elixir/Kernel.html#+/2
[guard-minus]: https://hexdocs.pm/elixir/Kernel.html#-/2
[guard-equals]: https://hexdocs.pm/elixir/Kernel.html#==/2
[guard-greater]: https://hexdocs.pm/elixir/Kernel.html#%3E/2
[guard-less]: https://hexdocs.pm/elixir/Kernel.html#%3C/2
[guard-and]: https://hexdocs.pm/elixir/Kernel.html#and/2
[guard-or]: https://hexdocs.pm/elixir/Kernel.html#or/2
[guard-not]: https://hexdocs.pm/elixir/Kernel.html#not/1
[guard-in]: https://hexdocs.pm/elixir/Kernel.html#in/2
[defguard]: https://hexdocs.pm/elixir/Kernel.html#defguard/1
[naming]: https://hexdocs.pm/elixir/naming-conventions.html#is_-prefix-is_foo
[where-guards-can-be-used]: https://hexdocs.pm/elixir/patterns-and-guards.html#where-patterns-and-guards-can-be-used
[exercism-pattern-matching]: https://exercism.org/tracks/elixir/concepts/pattern-matching
