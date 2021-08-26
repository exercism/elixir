# Hints

## General

- Review the functions available in the [`NaiveDateTime` module][naive-date-time], the [`Date` module][date], and the [`Time` module][time].

## 1. Parse the stored datetimes

- There is a [built-in function][naive-date-time-from-iso8601] that parses an ISO8601 datetime string and returns a `NaiveDateTime` struct.

## 2. Determine if a book was checked out before noon

- You can define a `Time` literal using the [`~T` sigil][time-sigil].
- There is a [built-in function][naive-date-time-to-time] that changes a `NaiveDateTime` struct to a `Time` struct.
- There is a [built-in function][time-compare] that checks which one of two `Time` structs is bigger.

## 3. Calculate the return date

- A day has `24 * 60 * 60` seconds.
- There is a [built-in function][naive-date-time-add] that adds a given number of seconds to a `NaiveDateTime` struct.
- There is a [built-in function][naive-date-time-to-date] that changes a `NaiveDateTime` struct to a `Date` struct.

## 4. Determine how late the return of the book was

- There is a [built-in function][naive-date-time-to-date] that changes a `NaiveDateTime` struct to a `Date` struct.
- There is a [built-in function][date-diff] that calculates the difference in days between two `Date` structs.

## 5. Determine if the book was returned on a Monday

- There is a [built-in function][naive-date-time-to-date] that changes a `NaiveDateTime` struct to a `Date` struct.
- There is a [built-in function][date-day-of-week] that returns the day of week for a given `Date` struct.

## 6. Calculate the late fee

- Combine together all of the functions that you defined in previous steps.

[naive-date-time]: https://hexdocs.pm/elixir/NaiveDateTime.html
[time]: https://hexdocs.pm/elixir/Time.html
[date]: https://hexdocs.pm/elixir/Date.html
[naive-date-time-from-iso8601]: https://hexdocs.pm/elixir/NaiveDateTime.html#from_iso8601!/2
[naive-date-time-to-time]: https://hexdocs.pm/elixir/NaiveDateTime.html#to_time/1
[naive-date-time-to-date]: https://hexdocs.pm/elixir/NaiveDateTime.html#to_date/1
[naive-date-time-add]: https://hexdocs.pm/elixir/NaiveDateTime.html#add/3
[time-sigil]: https://hexdocs.pm/elixir/Kernel.html#sigil_T/2
[time-compare]: https://hexdocs.pm/elixir/Time.html#compare/2
[date-diff]: https://hexdocs.pm/elixir/Date.html#diff/2
[date-day-of-week]: https://hexdocs.pm/elixir/Date.html#day_of_week/2
