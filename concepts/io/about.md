Functions for handling input and output are provided by the [`IO` module][module-io].

- [`IO.puts/2`][io-puts] writes a string to the standard output, followed by a newline. Returns `:ok`.
- [`IO.write/2`][io-write] writes a string to the standard output, without adding a newline. Returns `:ok`.
- [`IO.gets/2`][io-gets] reads a line from the standard input.
- [`IO.inspect/2`][io-inspect] writes anything to the standard output, accepts useful options like `:label`. Returns the value it was passed unchanged. Useful for debugging.

## `String.Chars` protocol

If you try to pass to [`IO.puts/2`][io-puts] a value that it cannot print, you will see a `Protocol.UndefinedError` error.

```elixir
IO.puts({:ok, 7})
# ** (Protocol.UndefinedError) protocol String.Chars not implemented for {:ok, 7} of type Tuple
```

When this happens, you might want to use [`IO.inspect/2`][io-inspect] instead.

## `IO.inspect/2` for debugging

[`IO.inspect/2`][io-inspect] is perfect for debugging because it returns its argument unchanged, it can print anything, and it offers a `:label` option.

```elixir
"HELLO\n"
|> String.trim()
|> IO.inspect(label: "step 1")
|> String.downcase()
|> IO.inspect(label: "step 2")
# > step 1: "HELLO"
# > step 2: "hello"
# => "hello"
```

## IO devices

The first argument to all those functions is an [IO device][io-devices], with the default value of `:stdio` (standard input/output). To write to the standard error device, use `:stderr` instead. An IO device could also be a process, for example one created by calling [`File.open/2`][file-open], which would allow writing to a file.

[module-io]: https://hexdocs.pm/elixir/IO.html
[io-puts]: https://hexdocs.pm/elixir/IO.html#puts/2
[io-write]: https://hexdocs.pm/elixir/IO.html#write/2
[io-gets]: https://hexdocs.pm/elixir/IO.html#gets/2
[io-inspect]: https://hexdocs.pm/elixir/IO.html#inspect/2
[io-device]: https://hexdocs.pm/elixir/IO.html#module-io-devices
[file-open]: https://hexdocs.pm/elixir/File.html#open/2
[io-devices]: https://hexdocs.pm/elixir/IO.html#module-io-devices
