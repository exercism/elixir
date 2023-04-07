# You can ignore this file if you're solving this exercise in the web editor,
# or on your own computer if you have Elixir version 1.12 or higher.
# You can check which Elixir version you have by running `elixir -v` in your terminal.
defmodule Math do
  import Bitwise

  # copied from https://github.com/elixir-lang/elixir/blob/v1.12.0/lib/elixir/lib/integer.ex#L103-L114
  def pow(base, exponent) when is_integer(base) and is_integer(exponent) do
    if exponent < 0, do: raise("exponent cannot be negative")
    guarded_pow(base, exponent)
  end

  # https://en.wikipedia.org/wiki/Exponentiation_by_squaring
  defp guarded_pow(_, 0), do: 1
  defp guarded_pow(b, 1), do: b
  defp guarded_pow(b, e) when (e &&& 1) == 0, do: guarded_pow(b * b, e >>> 1)
  defp guarded_pow(b, e), do: b * guarded_pow(b * b, e >>> 1)
end
