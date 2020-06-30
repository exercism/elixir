You have been tasked to write a service which ingests events. Each event has a date associated with it, but you notice that 3 different formats are being submitted to your service's endpoint:

- `"01/01/1970"`
- `"January 1, 1970"`
- `"Thursday, January 1, 1970"`

You would can see there are some similarities between each of them, and decide to write some composable regular expression patterns.

## 1. Match the day, month, and year from a date

Implement `day/0`, `month/0`, and `year/0` to return a string pattern which, when compiled, would match the numeric components in `"01/01/1970"` (`dd/mm/yyyy`). The date and month may appear as `1` or `01` (left padded with zeroes).

Do not worry about error checking. You can assume you will always be passed a valid numeric component.

```elixir
"31" =~ DateParser.day() |> Regex.compile!()
# => true
"12" =~ DateParser.month() |> Regex.compile!()
# => true
"1970" =~ DateParser.year() |> Regex.compile!()
# => true
```

## 2. Match the day of the week and the month of the year

Implement `day_names/0` and `month_name/0` to return a string pattern which, when compiled, would match the any named day of the week and the named month of the year respectively.

```elixir
"Tuesday" =~ DateParser.day_names() |> Regex.compile!()
# => true
"June" =~ DateParser.month_names() |> Regex.compile!()
# => true
```

## 3. Capture the day, month, and year

Implement `capture_day/0`, `capture_month/0`, `capture_year/0`, `capture_day_name/0`, `capture_month_name/0` to return a string pattern which captures the respective components to the names: `"day"`, `"month"`, `"year"`, `"day_name"`, `"month_name"`

```elixir
DateParser.capture_month_name()
|> Regex.compile!()
|> Regex.named_captures("December")
# => %{"month_name" => "December"}
```

## 4. Combine the captures to capture the whole date

Implement `capture_numeric_date/0`, `capture_month_name_date()`, and `capture_day_month_name_date/0` to return a string pattern which captures the components from part 3 using the respective date format.

```elixir
DateParser.capture_numeric_date()
|> Regex.compile!()
|> Regex.named_captures("01/01/1970")
# => %{"day" => "01", "month" => "01", "year" => "1970"}
```

## 5. Narrow the capture to match only on the date

Implement `match_numeric_date/0`, `match_month_name_date/0`, and `match_day_month_name_date/0` to return a compiled regular expression that only matches the date, and which can also capture the components.

```elixir
"The Unix epoch was Thursday, January 1, 1970" =~ DateParser.match_day_month_name_date()
# => false
"Thursday, January 1, 1970 was the Unix epoch." =~ DateParser.match_day_month_name_date()
# => false
"Thursday, January 1, 1970" =~ DateParser.match_day_month_name_date()
# => true

DateParser.match_day_month_name_date()
|> Regex.named_captures("Thursday, January 1, 1970")
# => %{
#     "day" => "1",
#     "day_name" => "Thursday",
#     "month_name" => "January",
#     "year" => "1970"
#   }
```
