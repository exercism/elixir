Anonymous functions in Elixir are [closures][closure]. They can access variables that are in scope when the function is defined.

```elixir
a = 7
square = fn -> a * a end
square.()
# => 49
```

However, a variable assigned inside of an anonymous function is not accessible outside of it:

```elixir
square = fn ->
  x = 3
  x * x
end

square.()
# => 9

x
# => ** (CompileError): undefined function x/0
```

[closure]: https://en.wikipedia.org/wiki/Closure_(computer_programming)
