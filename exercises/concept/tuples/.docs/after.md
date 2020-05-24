Great job! [Tuples][tuple-doc] are used commonly to group information informally. A common pattern through Elixir is to group function return values with a status

```elixir
File.read("hello.txt")
# => {:ok, "World"}

File.read("invalid.txt")
# => {:error, :enoent}
```

Then when writing Elixir functions, we can made use of an [assertive style][assertive-style] with [pattern matching][pattern-match-doc]:

```elixir
def read_file() do
  {:ok, contents} = File.read("hello.txt")
  contents
end
```

It might occur to you that this function may crash if the file does not exist. Don't worry, in Elixir it is often said to [**let it crash**][let-it-crash], because in Elixir applications, a supervising process will restart the application to a known-good state.

## Tuples

- [Tuple][tuple-doc] literals are enclosed with curly braces, `{}`.
- [Tuples][tuple-doc] may hold any data-type in contiguous memory, which is allocated when the tuple is created.
- [Tuples][tuple-doc] allow for constant-time read-access.
- When manipulating a [tuple][tuple-doc], rather than mutating the existing [tuple][tuple-doc], a new one is created.
- The [`Kernel`][kernel-module] and [`Tuple`][tuple-module] modules have useful functions for working with [tuples][tuple-doc].

## Pattern Matching

- [Pattern matching][pattern-match-doc] is explicitly performed using the match operator, [`=/2`][match-op].

  - Matches succeed when the _shape_ of the data on the left side of the operator matches the right side
  - When matches succeed, variables on the left are bound to the values on the right
  - using an underscore, `_`, allows us to disregard the values in those places

  ```elixir
  {:ok, number, _} = {:ok, 5, [4.5, 6.3]}

  number
  # => 5 is bound to this variable
  ```

- [Pattern matches][pattern-match-doc] may also occur in a function clause head, so that only arguments that match the pattern will invoke the function.
- Variables can be bound in a function clause [pattern match][pattern-match-doc]

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

## Additional Resources

- [The Beauty of Pattern Matching in Elixir - Poeticoding](https://www.poeticoding.com/the-beauty-of-pattern-matching-in-elixir/)
- [Pattern Matching - Joy of Elixir](https://joyofelixir.com/6-pattern-matching)

[assertive-style]: http://blog.plataformatec.com.br/2014/09/writing-assertive-code-with-elixir/
[let-it-crash]: https://www.amberbit.com/blog/2019/7/26/the-misunderstanding-of-let-it-crash/
[tuple-module]: https://hexdocs.pm/elixir/Tuple.html
[kernel-module]: https://hexdocs.pm/elixir/Kernel.html
[pattern-match-doc]: https://elixir-lang.org/getting-started/pattern-matching.html
[match-op]: https://hexdocs.pm/elixir/Kernel.SpecialForms.html#=/2
