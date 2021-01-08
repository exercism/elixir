Using `try..rescue` is a powerful construct for catching errors when they occur. Rescuing errors allows functions to return defined values when it is necessary. The `try..rescue` construct also offers us two additional features we can make use of:

- the `else` block
  - When the try block succeeds, the result is matched to this block.
- the `after` block
  - Whether the try block succeeds or raises, the code in the `after` block is always executed as long as the program is running at that point.
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
