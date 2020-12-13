In this exercise you'll be writing code to help a freelancer communicate with a project manager by providing a few utilities to quickly calculate daily and
monthly rates, optionally with a given discount.

We first establish a few rules between the freelancer and the project manager:

- The daily rate is 8 times the hourly rate.
- A month has 22 billable days.

The freelancer is offering to apply a discount if the project manager chooses to let the freelancer bill per month, which can come in handy if there is a certain budget the project manager has to work with.

Discounts are modeled as fractional numbers representing percentage, for example `25.0` (25%).

## 1. Calculate the daily rate given an hourly rate

Implement a function to calculate the daily rate given an hourly rate:

```elixir
FreelancerRates.daily_rate(60)
# => 480.0
```

The returned daily rate should be a float.

## 2. Calculate the monthly rate, given an hourly rate and a discount

Implement a function to calculate the monthly rate, and apply a discount:

```elixir
FreelancerRates.monthly_rate(77, 10.5)
# => 12130
```

The returned monthly rate should be rounded up to the nearest integer.

## 3. Calculate the number of workdays given a budget, hourly rate and discount

Implement a function that takes a budget, a hourly rate, and a discount, and calculates how many days of work that covers.

```elixir
FreelancerRates.days_in_budget(20000, 80, 11.0)
# => 35.1
```

The returned number of days should be rounded down to one decimal place.
