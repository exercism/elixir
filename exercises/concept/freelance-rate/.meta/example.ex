defmodule FreelancerRate do
  def daily_rate(hourly_rate) do
    hourly_rate * 8.0
  end

  def monthly_rate(hourly_rate, discount) do
    monthly_rate_before_discount = daily_rate(hourly_rate) * 22.0
    monthly_rate_after_discount = apply_discount(monthly_rate_before_discount, discount)
    trunc(Float.ceil(monthly_rate_after_discount))
  end

  def days_in_budget(budget, hourly_rate, discount) do
    daily_rate_before_discount = daily_rate(hourly_rate)
    daily_rate_after_discount = apply_discount(daily_rate_before_discount, discount)
    days_in_budget = budget / daily_rate_after_discount
    Float.floor(days_in_budget, 1)
  end

  defp apply_discount(before_discount, discount) do
    before_discount - before_discount * (discount / 100.0)
  end
end
