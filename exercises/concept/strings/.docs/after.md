[Strings][getting-started-strings] in Elixir are delimited by double quotes, and they are encoded in UTF-8:

```elixir
"Hi!"
```

Strings can be concatenated using the [`<>/2`][kernel-concat] operator:

```elixir
"Welcome to" <> " " <> "New York"
# => "Welcome to New York"
```

Strings in Elixir support [interpolation][string-interpolation] using the `#{}` syntax:

```elixir
"6 * 7 = #{6 * 7}"
# => "6 * 7 = 42"
```

Any Elixir expression is valid inside the interpolation. If a string is given, the string is interpolated as is. If any other value is given, Elixir will attempt to convert it to a string.

```elixir
"Elixir can convert booleans to strings: #{true}"
# => "Elixir can convert booleans to strings: true"

"And #{["lists", ", ", "too!"]}"
# => "And lists, too!"

"But not functions: #{fn x -> x end}"
# => ** (Protocol.UndefinedError) protocol String.Chars not implemented for #Function<7.126501267/1 in :erl_eval.expr/5> of type Function
#        (elixir 1.10.1) lib/string/chars.ex:3: String.Chars.impl_for!/1
#        (elixir 1.10.1) lib/string/chars.ex:22: String.Chars.to_string/1
```

Elixir provides many functions for working with strings in the _String module_. If you are unsure how to process a string in the way you need it, make sure to browse [functions available in the _String module_][string-module-functions] and you will most likely find what you need.

```elixir
String.downcase("PLEASE NO SHOUTING")
# => "please no shouting"

String.split("hello", "", trim: true)
# => ["h", "e", "l", "l", "o"]

String.replace("Do I enjoy Elixir? Maybe...", "Maybe...", "Definitely!")
# => "Do I enjoy Elixir? Definitely!"

String.at("12345", 2)
# => "3"
```

Using some of those functions, remember that the first character in a string has the index `0`.

Some characters need to be [escaped][escape-characters] to be put in a string, e.g. newlines, double-quotes, or the `#` character:

```elixir
"\"A\" is the \#1st letter of the alphabet.\n"
```

You can print a string to the console using [`IO.puts/2`][io-puts]:

```elixir
IO.puts("\"A\" is the \#1st letter of the alphabet.\n")
```

To comfortably work with texts with a lot of newlines, use the [triple-double-quote heredoc syntax][heredoc-syntax] instead:

```elixir
"""
1
2
3
"""
```

You will very often find this syntax used for documenting code:

```elixir
defmodule MyApp.Hello do
  @moduledoc """
  This is the Hello module.
  """

  @doc """
  Says hello to the given `name`.

  Returns `:ok`.

  ## Examples

      iex> MyApp.Hello.world(:john)
      :ok

  """
  def world(name) do
    IO.puts("hello #{name}")
  end
end
```

[getting-started-strings]: https://elixir-lang.org/getting-started/basic-types.html#strings
[kernel-concat]: https://hexdocs.pm/elixir/Kernel.html#%3C%3E/2
[io-puts]: https://hexdocs.pm/elixir/IO.html#puts/2
[string-module-functions]: https://hexdocs.pm/elixir/String.html#functions
[string-interpolation]: https://hexdocs.pm/elixir/String.html#module-interpolation
[escape-characters]: https://hexdocs.pm/elixir/String.html#module-escape-characters
[heredoc-syntax]: https://elixir-examples.github.io/examples/multiline-strings-heredocs
