The basic `try-rescue` concept can be extended to support `else` and `after` clauses:

- The `else` block:
  - Where a pattern match on the successful result from the try-block occurs
- The `after` block:
  - Where functions are invoked whether the try-block succeeds or is rescued as long as the program is running.
  - The result of the `after` block is not returned to the calling scope.

```elixir
try do
  :a
rescue
  _ -> :error
else
  :a -> :success
after
  :some_action
end
# => :success
```
