# Hints

## General

- The distance of a point `(x, y)` from the center of the target `(0, 0)` can be calculated with `sqrt(x * x + y * y)`.
- Elixir doesn't have a built-in square root function, but the Erlang function `:math.sqrt/1` is available.
- Alternatively, you can calculate the square root of `x` by raising it to the power of `1/2`. In other words, `def sqrt(x), do: Float.pow(x, 0.5)`. Note that `Float.pow/2` only accepts float arguments, integers need to be converted explicitly, for example with `1.0 * x`.
