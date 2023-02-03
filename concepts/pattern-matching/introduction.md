# Introduction

The use of pattern matching is dominant in assertive, idiomatic Elixir code. You might recall that `=/2` is described as a match operator rather than as an assignment operator. When using the match operator, if the pattern on the left matches the right, any variables on the left are bound, and the value of the right side is returned. A `MatchError` is raised if there is no match.

```elixir
2 = 2
# => 2
# Literals can be matched if they are the same

2 = 3
# => ** (MatchError) no match of right hand side value: 3

{_, denominator} = Float.ratio(0.25)
# => {1, 4}
# the variable `denominator` is bound to the value 4
```

Remember, matches occur from the right side to the left side.

In the last example, if we don't need a variable in a pattern match, we can discard it by referencing `_`.
Any variable starting with an `_` is not tracked by the runtime.

## Pattern matching in named functions

Pattern matching is also a useful tool when creating multiple function clauses. Pattern matching can be used on the functions' arguments which then determines which function clause to invoke -- starting from the top of the file down until the first match. Variables may be bound in a function head and used in the function body.

```elixir
defmodule Example do
  def named_function(:a = variable_a) do
    {variable_a, 1}
  end

  def named_function(:b = variable_b) do
    {variable_b, 2}
  end
end

Example.named_function(:a)
# => {:a, 1}

Example.named_function(:b)
# => {:b, 2}

Example.named_function(:c)
# => ** (FunctionClauseError) no function clause matching in Example.named_function/1
```
