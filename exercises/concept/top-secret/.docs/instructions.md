# Instructions

You're part of a task force fighting against corporate espionage. You have a secret informer at Shady Company X, which you suspect of stealing secrets from its competitors.

Your informer, Agent Ex, is an Elixir developer. She is encoding secret messages in her code.

To decode her secret messages:

- Take all functions (public and private) in the order they're defined in.
- For each function, take the first `n` characters from its name, where `n` is the function's arity.

## 1. Turn code into data

Implement the `TopSecret.to_ast/1` function. It should take a string with Elixir code and return its AST.

```elixir
TopSecret.to_ast("div(4, 3)")
# => {:div, [line: 1], [4, 3]}
```

## 2. Parse a single AST node

Implement the `TopSecret.decode_secret_message_part/2` function. It should take an AST node and an accumulator for the secret message (a list). It should return a tuple with the AST node unchanged as the first element, and the accumulator as the second element.

If the operation of the AST node is defining a function (`def` or `defp`), prepend the function name (changed to a string) to the accumulator. If the operation is something else, return the accumulator unchanged.

```elixir
ast_node = TopSecret.to_ast("defp cat(a, b, c), do: nil")
TopSecret.decode_secret_message_part(ast_node, ["day"])
# => {ast_node, ["cat", "day"]}

ast_node = TopSecret.to_ast("10 + 3")
TopSecret.decode_secret_message_part(ast_node, ["day"])
# => {ast_node, ["day"]}
```

This function doesn't need to do any recursive calls to check the whole AST, only the given node. We will traverse the whole AST with built-in tools in the last step.

## 3. Decode the secret message part from function definition

Extend the `TopSecret.decode_secret_message_part/2` function. If the operation in the AST node is defining a function, don't return the whole function name. Instead, check the function's arity. Then, return only first `n` character from the name, where `n` is the arity.

```elixir
ast_node = TopSecret.to_ast("defp cat(a, b), do: nil")
TopSecret.decode_secret_message_part(ast_node, ["day"])
# => {ast_node, ["ca", "day"]}

ast_node = TopSecret.to_ast("defp cat(), do: nil")
TopSecret.decode_secret_message_part(ast_node, ["day"])
# => {ast_node, ["", "day"]}
```

## 4. Fix the decoding for functions with guards

Extend the `TopSecret.decode_secret_message_part/2` function. Make sure the function's name and arity is correctly detected for function definitions that use guards.

```elixir
ast_node = TopSecret.to_ast("defp cat(a, b) when is_nil(a), do: nil")
TopSecret.decode_secret_message_part(ast_node, ["day"])
# => {ast_node, ["ca", "day"]}
```

## 5. Decode the full secret message

Implement the `TopSecret.decode_secret_message/1` function. It should take a string with Elixir code and return the secret message as a string decoded from all function definitions found in the code. Make sure to reuse functions defined in previous steps.

```elixir
code = """
defmodule MyCalendar do
  def busy?(date, time) do
    Date.day_of_week(date) != 7 and
      time.hour in 10..16
  end

  def yesterday?(date) do
    Date.diff(Date.utc_today, date)
  end
end
"""

TopSecret.decode_secret_message(code)
# => "buy"
```
