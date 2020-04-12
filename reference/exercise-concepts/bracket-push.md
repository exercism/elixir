# Concepts for bracket-push

## Approach

Note: there were a lot of different approaches to this one...

### Recursive approach

```elixir
defmodule BracketPush do

  # NOTE: As written, this program only supports single-character delimiters.
  @opening_delimiters ["[", "{", "("]
  @closing_delimiters [")", "}", "]"]

  @doc """
  Checks that all the brackets and braces in the string are matched correctly, and nested correctly.
  """
  @spec check_brackets(String.t()) :: boolean
  def check_brackets(str) do
    case seek_start(str) do
      {:error, _} -> false
      _ -> true
    end
  end

  ###########################################################################
  # Use cases as we traverse a string looking for starting delimiter:
  ###########################################################################
  # End of string!
  defp seek_start(""), do: ""

  # opening blocks --> seek closing
  defp seek_start("[" <> tail), do: seek_end("]", tail)
  defp seek_start("{" <> tail), do: seek_end("}", tail)
  defp seek_start("(" <> tail), do: seek_end(")", tail)

  # Unexpected closing delimiter
  defp seek_start(<<h :: binary - size(1), _ :: binary>>) when h in @closing_delimiters,
       do: {:error, "Unexpected closing delimiter: '#{h}'"}

  # Filler character: shift and keep seeking
  defp seek_start(<<_ :: binary - size(1), tail :: binary>>), do: seek_start(tail)


  ###########################################################################
  # Use Cases as we look for the ending delimiter:
  ###########################################################################
  # End of string! --> fail
  defp seek_end(_, ""), do: {:error, "Closing delimiter not found"}

  # Another opening delimiter found! --> permutation! Down the wormhole!  seek_start()
  defp seek_end(_, <<h :: binary - size(1), _ :: binary>> = str) when h in @opening_delimiters, do: seek_start(str)

  # Matching Closing tag found! --> return whatever is left of the string
  defp seek_end(closing_delimiter, <<h :: binary - size(1), tail :: binary>>) when closing_delimiter == h, do: tail

  # Unmatched closing delimiter
  defp seek_end(_, <<h :: binary - size(1), _ :: binary>>) when h in @closing_delimiters,
       do: {:error, "Unmatched closing delimiter: '#{h}'"}

  # Filler character --> shift and keep seeking
  defp seek_end(closing_delimiter, <<_ :: binary - size(1), tail :: binary>>),
       do: seek_end(closing_delimiter, tail)

end
```

### Stack-based approach

```elixir
defmodule MatchingBrackets do
  @doc """
  Checks that all the brackets and braces in the string are matched correctly, and nested correctly
  """
  @spec check_brackets(String.t()) :: boolean
  def check_brackets(str), do: do_check_brackets(str, [])

  defp do_check_brackets(<<char, rest::binary>>, brackets_list) when char in [?(, ?[, ?{] do
    do_check_brackets(rest, [char | brackets_list])
  end

  defp do_check_brackets(<<char, rest::binary>>, brackets_list) when char in [?), ?], ?}] do
    {head, tail} = List.pop_at(brackets_list, 0)
    brackets_match?(head, char) && do_check_brackets(rest, tail)
  end

  defp do_check_brackets(<<_char, rest::binary>>, brackets_list) do
    do_check_brackets(rest, brackets_list)
  end

  defp do_check_brackets("", []), do: true
  defp do_check_brackets("", [_head | _tail]), do: false

  defp brackets_match?(?(, ?)), do: true
  defp brackets_match?(?[, ?]), do: true
  defp brackets_match?(?{, ?}), do: true
  defp brackets_match?(_left, _right), do: false
end
```

## Concepts

The big concept here is the `[head | tail]` traversal pattern (just like a parser): i.e. how do we traverse the string once and avoid having to use regular expressions?

- recursion `[head | tail]`
- naming
- modules
- module attributes
  - @doc
    - documentation
  - @spec
    - types
    - String.t()
    - boolean
- pattern matching
  - on function signature
- guards
  - when
- standard library modules
  - Kernel
    - in/2
- types
  - binaries
    - special forms `<< >>` syntax
  - string
  - lists
    - head and tail notation forms
