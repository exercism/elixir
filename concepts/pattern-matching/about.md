When writing Elixir functions, we can made use of an [assertive style][assertive-style] with [pattern matching][pattern-match-doc]:

```elixir
def read_file() do
  {:ok, contents} = File.read("hello.txt")
  contents
end
```

- Pattern matching is explicitly performed using the match operator, [`=/2`][match-op].

  - Matches succeed when the _shape_ of the data on the left side of the operator matches the right side
  - When matches succeed, variables on the left are bound to the values on the right
  - Using an underscore, `_`, allows us to disregard the values in those places

    ```elixir
    {:ok, number, _} = {:ok, 5, [4.5, 6.3]}

    number
    # => 5 is bound to this variable
    ```

  - [The pin operator `^`][getting-started-pin-operator] can be used to prevent rebounding a variable and instead pattern match against its existing value

    ```elixir
    number = 10
    {:ok, ^number, _} = {:ok, 5, [4.5, 6.3]}
    # => ** (MatchError) no match of right hand side value: {:ok, 5, [4.5, 6.3]}
    ```

- Pattern matches may also occur in a function clause head, so that only arguments that match the pattern will invoke the function.
- Variables can be bound in a function clause pattern match

  ```elixir
  defmodule Example do
    def named_function(:a = atom_variable) do
      {atom_variable, 1}
    end
  end

  Example.named_function(:a)
  # => {:a, 1}
  # The first function clause matches, so it is invoked

  Example.named_function(:b)
  # => ** (FunctionClauseError) no function clause matching in Example.named_function/1
  ```

[assertive-style]: http://blog.plataformatec.com.br/2014/09/writing-assertive-code-with-elixir/
[pattern-match-doc]: https://elixir-lang.org/getting-started/pattern-matching.html
[match-op]: https://hexdocs.pm/elixir/Kernel.SpecialForms.html#=/2
[getting-started-pin-operator]: https://elixir-lang.org/getting-started/pattern-matching.html#the-pin-operator
