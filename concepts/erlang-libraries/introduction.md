Elixir code runs in the BEAM virtual machine. BEAM is part of the Erlang Run-Time System. Being inspired by Erlang, and sharing its run environment, Elixir provides great interoperability with Erlang libraries. This means that Elixir developers can use Erlang libraries from within their Elixir code. In fact, writing Elixir libraries for functionality already provided by Erlang libraries is discouraged in the Elixir community.

As a result, certain functionality, like mathematical operations or timer functions, is only available in Elixir via Erlang.

Erlang's standard library is available for use in our Elixir code without any extra steps necessary.

Erlang functions can be called in the same way we call Elixir functions, with one small difference. Erlang module names are `snake_case` atoms. For example, to call the Erlang `pi/0` function from the `math` module, one would write:

```elixir
:math.pi()
# => 3.141592653589793
```

The most commonly used Erlang functions that do not have an Elixir equivalent are:

- `:timer.sleep/1` which suspends a process for the given amount of milliseconds.
- `:rand.uniform/0` which generates a random float `x`, where `0.0 <= x < 1.0`.
- `:io_lib.format/2` which provides C-style string formatting (using control sequences). Using this function, we could for example print an integer in any base between 2 and 36 or format a float with desired precision. Note that this function, like many Erlang functions, returns a charlist.
- The `math` module that provides mathematical functions such as `sin/1`, `cos/1`, `log2/1`, `log10/1`, `pow/2`, and more.

To discover Erlang's standard library, explore the [STDLIB Reference Manual][erl-stdlib-ref].

[erl-stdlib-ref]: http://erlang.org/doc/apps/stdlib/index.html
