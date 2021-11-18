# About

Elixir's standard library offers 4 different modules for working with dates and time, each with its own struct.

- The [`Date` module][date]. A `Date` struct can be created with the [`~D` sigil][sigil-d].
    ```elixir
    ~D[2021-01-01]
    ```

- The [`Time` module][time]. A `Time` struct can be created with the [`~T` sigil][sigil-t].
    ```elixir
    ~T[12:00:00]
    ```

- The [`NaiveDateTime` module][naivedatetime] for datetimes without a timezone. A `NaiveDateTime` struct can be created with the [`~N` sigil][sigil-n].
    ```elixir
    ~N[2021-01-01 12:00:00]
    ```

- The [`DateTime` module][datetime] for datetimes with a timezone. Using this module for timezones other than UTC requires an external dependency, a timezone database. A `DateTime` struct can be represented with the [`~U` sigil][sigil-u], but should be created using `DateTime` functions instead.
    ```elixir
    DateTime.new!(~D[2021-01-01], ~T[12:00:00], "Etc/UTC")
    # => ~U[2021-01-01 12:00:00Z]
    ```

## Comparisons

To compare dates or times to one another, look for a `compare` or `diff` function in the corresponding module. Comparison operators such as `==`, `>`, and `<` _seem_ to work, but they don't do a correct semantic comparison for those structs.

```elixir
Date.compare(~D[2020-11-30], ~D[2020-12-01])
# => :lt

Time.diff(~T[13:45:00], ~T[13:46:30])
# => -90
```

## Shifting

Dates, time, and datetimes can be shifted forwards and backwards in time using the `add/2` function from the corresponding module.

```elixir
# add 4 days
Date.add(~D[2021-01-01], 4)
# => ~D[2021-01-05]

# subtract 1 second
Time.add(~T[12:00:00], -1)
# => ~T[11:59:59.000000]

# add 4 days and 30 seconds
NaiveDateTime.add(~N[2021-01-01 12:00:00], 4 * 24 * 60 * 60 + 30)
# => ~N[2021-01-05 12:00:30]
```

## Conversions

A `NaiveDateTime` struct can be deconstructed into a `Date` struct and a `Time` struct using [`NaiveDateTime.to_date/1`][naivedatetime-to-date] and [`NaiveDateTime.to_time/1`][naivedatetime-to-time]. The opposite can be achieved with [`NaiveDateTime.new!/2`][naivedatetime-new].

```elixir
NaiveDateTime.to_date(~N[2021-01-01 12:00:00])
# => ~D[2021-01-01]

NaiveDateTime.to_time(~N[2021-01-01 12:00:00])
# => ~T[12:00:00]

NaiveDateTime.new!(~D[2021-01-01], ~T[12:00:00])
# => ~N[2021-01-01 12:00:00]
```

[naivedatetime]: https://hexdocs.pm/elixir/NaiveDateTime.html
[datetime]: https://hexdocs.pm/elixir/DateTime.html
[time]: https://hexdocs.pm/elixir/Time.html
[date]: https://hexdocs.pm/elixir/Date.html
[sigil-t]: https://hexdocs.pm/elixir/Kernel.html#sigil_T/2
[sigil-d]: https://hexdocs.pm/elixir/Kernel.html#sigil_D/2
[sigil-u]: https://hexdocs.pm/elixir/Kernel.html#sigil_U/2
[sigil-n]: https://hexdocs.pm/elixir/Kernel.html#sigil_N/2
[naivedatetime-to-date]: https://hexdocs.pm/elixir/NaiveDateTime.html#to_date/1
[naivedatetime-to-time]: https://hexdocs.pm/elixir/NaiveDateTime.html#to_time/1
[naivedatetime-new]: https://hexdocs.pm/elixir/NaiveDateTime.html#new/2
[erl-calendar]: https://www.erlang.org/doc/man/calendar.html
