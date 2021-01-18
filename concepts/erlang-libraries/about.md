Elixir code runs in the [BEAM virtual machine][beam]. BEAM is part of the [Erlang][erlang] Run-Time System. Being inspired by Erlang, and sharing its run environment, Elixir provides great interoperability with Erlang libraries. This means that Elixir developers can use Erlang libraries from within their Elixir code. In fact, writing Elixir libraries for functionality already provided by Erlang libraries is discouraged in the Elixir community.

As a result, certain functionality, like mathematical operations or timer functions, is only available in Elixir via Erlang.

This close relationship between Elixir and Erlang means that to become a proficient Elixir developer, you might want to invest some time in learning the basic syntax of Erlang.

## How to use

Erlang's standard library is available for use in our Elixir code without any extra steps necessary.

Erlang functions can be called in the same way we call Elixir functions, with one small difference. Erlang module names are `snake_case` atoms. For example, to call the Erlang `pi/0` function from the `math` module, one would write:

```elixir
:math.pi()
# => 3.141592653589793
```

## Most commonly used Erlang modules

The most commonly used Erlang modules provide functionality that Elixir's standard library lacks. They are:

- The `timer` module, which provides functions such as [`sleep/1`][erl-timer-sleep], [`send_after/2`][erl-timer-send-after], and [`send_interval`][erl-timer-send-interval].
- The `rand` module, which provides functions such as [`uniform/0`][erl-rand-uniform], [`normal/0`][erl-rand-normal], and [`seed/2`][erl-rand-seed-2].
- [`:io_lib.format/2`][erl-io-lib-format] which provides C-style string formatting (using control sequences).
- The `math` module that provides mathematical functions such as [`sin/1`][erl-math-sin], [`cos/1`][erl-math-cos], [`log2/1`][erl-math-log2], [`log10/1`][erl-math-log10], [`pow/2`][erl-math-pow], and more.
- The [`queue`][erl-queue] module which provides a queue data structure.
- The [`crypto`][erl-crypto] module which provides cryptographic functions.
- The [`zip`][erl-zip] module which provides functions for working with zip archives.

To discover Erlang's standard library, explore the [STDLIB Reference Manual][erl-stdlib-ref].

Elixir interoperability with Erlang libraries is not limited to Erlang's standard library. Any Erlang library can be used in Elixir's code.

[erlang]: https://en.wikipedia.org/wiki/Erlang_(programming_language)
[beam]: https://en.wikipedia.org/wiki/BEAM_(Erlang_virtual_machine)
[erl-stdlib-ref]: http://erlang.org/doc/apps/stdlib/index.html
[erl-timer-sleep]: http://erlang.org/doc/man/timer.html#sleep-1
[erl-timer-send-after]: http://erlang.org/doc/man/timer.html#send_after-2
[erl-timer-send-interval]: http://erlang.org/doc/man/timer.html#send_interval-2
[erl-rand-uniform]: http://erlang.org/doc/man/rand.html#uniform-0
[erl-rand-normal]: http://erlang.org/doc/man/rand.html#normal-0
[erl-rand-seed-2]: http://erlang.org/doc/man/rand.html#seed-2
[erl-io-lib-format]: http://erlang.org/doc/man/io_lib.html#format-2
[erl-math-sin]: http://erlang.org/doc/man/math.html#sin-1
[erl-math-cos]: http://erlang.org/doc/man/math.html#cos-1
[erl-math-log2]: http://erlang.org/doc/man/math.html#log2-1
[erl-math-log10]: http://erlang.org/doc/man/math.html#log10-1
[erl-math-pow]: http://erlang.org/doc/man/math.html#pow-2
[erl-queue]: http://erlang.org/doc/man/queue.html
[erl-crypto]: http://erlang.org/doc/man/crypto.html
[erl-zip]: http://erlang.org/doc/man/zip.html
