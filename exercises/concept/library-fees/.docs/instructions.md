Your librarian friend has asked you to extend her library software to automatically calculate late fees.
Her current system stores the exact date and time of a book checkout as an ISO8601 datetime string.
She runs a local library in a small town in Ghana, which uses the GMT timezone (UTC +0), and doesn't need to worry about other timezones.

## 1. Parse the stored datetimes

Implement the `LibraryFees.datetime_from_string/1` functions. It should take an ISO8601 datetime string as an argument, and return a `NaiveDateTime` struct.

```elixir
LibraryFees.datetime_from_string("2021-01-01T13:30:45Z")
# => ~N[2021-01-01 13:30:45]
```

## 2. Determine if a book was checked out before noon

If a book was checked out before noon, the reader has 28 days to return it. If it was checked out at or after noon, it's 29 days.

Implement the `LibraryFees.before_noon?/1` function. It should take a `NaiveDateTime` struct and return a boolean.

```elixir
LibraryFees.before_noon?(~N[2021-01-12 08:23:03])
# => true
```

## 3. Calculate the return datetime

Based on the checkout datetime, calculate the return datetime.

Implement the `LibraryFees.return_datetime/1` function. It should take a `NaiveDateTime` struct and return a `NaiveDateTime` struct, either 28 or 29 days later.

```elixir
LibraryFees.return_datetime(~N[2020-11-28 15:55:33])
# => ~N[2020-12-27 15:55:33]
```

## 4. Determine how late the return of the book was

The library has a flat rate for late returns. To be able to calculate the fee, we need to know how many days after the return date the book was actually returned.

Implement the `LibraryFees.days_late/2` function. It should take two `NaiveDateTime` structs, the planned return datetime and the actual return datetime. If the planned return datetime is on an earlier or the same day as the actual return datetime, the function should return 0. Otherwise, the function should return the difference between those two datetimes in days.

```elixir
LibraryFees.days_late(~N[2020-12-27 15:55:33], ~N[2021-01-03 09:23:36])
# => 7
```

## 5. Determine if the book was returned on a monday

The library has a special offer for returning books on Mondays.

Implement the `LibraryFees.monday?/1` function. It should take a `NaiveDateTime` struct and return a boolean.

```elixir
LibraryFees.monday?(~N[2021-01-03 13:30:45Z])
# => false
```

## 6. Calculate the late fee

Implement the `LibraryFees.calculate_late_fee/3` function. It should take three arguments - two ISO8601 datetime strings, checkout datetime and actual return datetime, and the late fee for one day. It should return the total late fee according to how late the actual return of the book was.

Include the special Monday offer. If you return the book on Monday, your late fee is 50% off, rounded down.

```elixir
# Sunday, 7 days late
LibraryFees.calculate_late_fee("2020-11-28T15:55:33Z", "2021-01-03T13:30:45Z", 100)
# => 700

# one day later, Monday, 8 days late
LibraryFees.calculate_late_fee("2020-11-28T15:55:33Z", "2021-01-04T09:02:11Z", 100)
# => 400
```
