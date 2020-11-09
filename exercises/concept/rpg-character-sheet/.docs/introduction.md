## io

Functions for handling input and output are provided by the `IO` module.

### Output

To write a string to the standard output, use `IO.puts`. `IO.puts` always adds a new line at the end of the string. If you don't want that behavior, use `IO.write` instead. Both functions return the atom `:ok` if they succeed.

```elixir
IO.puts("Hi!")
# > Hi!
# => :ok
```

`IO.puts` is useful for writing strings, but not much else. If you need a tool for debugging that will allow you to write any value to standard output, use `IO.inspect` instead. `IO.inspect` returns the value it was passed unchanged, so it can be inserted in any point in your code. It also accepts many options, for example `:label`, that will allow you to distinguish it form other `IO.inspect` calls.

### Input

To read a line from the standard input, use `IO.gets`. `IO.gets` accepts one argument - a string that it will print as a prompt for the input. `IO.gets` doesn't add a new line after the prompt, you need it include it yourself if you need it.

```elixir
IO.gets("What's your name?\n")
# > What's your name?
# < Mary
# => "Mary\n"
```
