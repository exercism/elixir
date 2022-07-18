# Introduction

## Dates and Time

Elixir's standard library offers 4 different modules for working with dates and time, each with its own struct.

- The `Date` module. A `Date` struct can be created with the `~D` sigil.

  ```elixir
  ~D[2021-01-01]
  ```

- The `Time` module. A `Time` struct can be created with the `~T` sigil.

  ```elixir
  ~T[12:00:00]
  ```

- The `NaiveDateTime` module for datetimes without a timezone. A `NaiveDateTime` struct can be created with the `~N` sigil.

  ```elixir
  ~N[2021-01-01 12:00:00]
  ```

- The `DateTime` module for datetimes with a timezone. Using this module for timezones other than UTC requires an external dependency, a timezone database.

### Comparisons

To compare dates or times to one another, look for a `compare` or `diff` function in the corresponding module. Comparison operators such as `==`, `>`, and `<` _seem_ to work, but they don't do a correct semantic comparison for those structs.
