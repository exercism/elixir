# Hints

## General

- Read about using `with` in the [official Getting Started guide][getting-started-with].
- Review the functions available in the [`NaiveDateTime` module][naive-date-time], the [`Date` module][date], and the [`Time` module][time].

## 1. Get into the building

- Don't overthink this one. The function `enter_building` already fulfills the requirements. 

## 2. Go to the information desk and find which counter you should go to

- In the matching part of `with`, there should be three lines:
    - `enter_building` matched with `<-`,
    - `find_counter_information` matched with `<-`,
    - the result function you just matched applied to your birthday match with `=`.
- In the `do` part of `with`, return an `:ok` tuple with the counter value you obtained.
- In the `else` part of with:
    - expect for a `:coffee_break` tuple and return a `:return` tuple with a `NaiveDateTime`,
    - return other messages as they are.
- A minute has `60` seconds.
- There is a [built-in function][naive-date-time-add] that adds a given number of seconds to a `NaiveDateTime` struct.

## 3. Go to the counter and get your form stamped

- In the matching part of `with`, match `stamp_form` with `<-`.
- In the `do` part of `with`, return an `:ok` tuple with the checksum.

## 4. Receive your new passport

- In the `do` part of `with`, use `get_new_passport_number` and return the result in an `:ok` tuple.

[with]: https://hexdocs.pm/elixir/Kernel.SpecialForms.html#with/1
[getting-started-with]: https://elixir-lang.org/getting-started/mix-otp/docs-tests-and-with.html#with
[naive-date-time]: https://hexdocs.pm/elixir/NaiveDateTime.html
[time]: https://hexdocs.pm/elixir/Time.html
[date]: https://hexdocs.pm/elixir/Date.html
[naive-date-time-add]: https://hexdocs.pm/elixir/NaiveDateTime.html#add/3


