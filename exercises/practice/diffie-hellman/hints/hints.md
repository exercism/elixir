For generating random numbers, Erlang's `:rand.uniform` or `Enum.random` are
good places to start.

`:math.pow |> round` can be used to find the power of a number, and `rem` for
the modulus.

Neither of those works particularly well (or quickly) for very large integers.
Cryptography generally makes use of numbers larger than 1024 bits. Erlang's
:crypto module has a useful function for finding the modulus of a power,
particularly for enormous integers, but you might need :binary to decode it.
