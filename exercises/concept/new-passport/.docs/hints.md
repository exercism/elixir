# Hints

## General

- Read about using `with` in the [official Getting Started guide][getting-started-with].
- Review the functions available in the [`NaiveDateTime` module][naive-date-time], the [`Date` module][date], and the [`Time` module][time].

## 1. Get into the building

- Match the `:ok` tuple returned by `enter_building/1` in `with` with `<-`.
- In the `do` part of `with`, return an `:ok` tuple with the value you just matched.
- Since you don't need to modify the error, you don't need an `else` block.

## 2. Go to the information desk and find which counter you should go to

- Match the `:ok` tuple returned by `find_counter_information/1` in `with` with `<-`.
- Apply the anonymous function your just matched and match the result with `<-`.
- In the `do` part of `with`, return an `:ok` tuple with the counter you obtained.
- Add an `else` block that will expect a `:coffee_break` tuple and return a `:retry` tuple with a `NaiveDateTime`.
- A minute has `60` seconds.
- There is a [built-in function][naive-date-time-add] that adds a given number of seconds to a `NaiveDateTime` struct.
- Other errors should be returned as they are.

## 3. Go to the counter and get your form stamped

- Match the `:ok` tuple returned by `stamp_form/3` in `with` with `<-`.
- In the `do` part of `with`, return an `:ok` tuple with the checksum.

## 4. Receive your new passport

- In the `do` part of `with`, use `get_new_passport_number/3` and return the result in an `:ok` tuple.

[with]: https://hexdocs.pm/elixir/Kernel.SpecialForms.html#with/1
[getting-started-with]: https://hexdocs.pm/elixir/docs-tests-and-with.html#with
[naive-date-time]: https://hexdocs.pm/elixir/NaiveDateTime.html
[time]: https://hexdocs.pm/elixir/Time.html
[date]: https://hexdocs.pm/elixir/Date.html
[naive-date-time-add]: https://hexdocs.pm/elixir/NaiveDateTime.html#add/3


