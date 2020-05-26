defmodule FreelancerRateTest do
  use ExUnit.Case

  describe "daily_rate/1" do
    # @tag :pending
    test "it's the hourly_rate times 8" do
      assert FreelancerRate.daily_rate(50) == 400.0
    end

    @tag :pending
    test "it always returns a float" do
      assert FreelancerRate.daily_rate(60) === 480.0
    end

    @tag :pending
    test "it does not round" do
      assert FreelancerRate.daily_rate(55.1) == 440.8
    end
  end

  describe "monthly_rate/1" do
    @tag :pending
    test "it's the daily_rate times 22" do
      assert FreelancerRate.monthly_rate(62, 0.0) == 10_912
    end

    @tag :pending
    test "it always returns an integer" do
      assert FreelancerRate.monthly_rate(70, 0.0) === 12_320
    end

    @tag :pending
    test "the result is rounded up" do
      # 11_052.8
      assert FreelancerRate.monthly_rate(62.8, 0.0) == 11_053
      # 11_475.2
      assert FreelancerRate.monthly_rate(65.2, 0.0) == 11_476
    end

    @tag :pending
    test "gives a discount" do
      # 11_792 - 12% * 11_792 = 10_376.96
      assert FreelancerRate.monthly_rate(67, 12.0) == 10_377
    end
  end

  describe "days_in_budget/3" do
    @tag :pending
    test "it's the budget divided by the daily rate" do
      assert FreelancerRate.days_in_budget(1_600, 50, 0.0) == 4
    end

    @tag :pending
    test "it always returns a float" do
      assert FreelancerRate.days_in_budget(520, 65, 0.0) === 1.0
    end

    @tag :pending
    test "it rounds down to one decimal place" do
      # 10.02273
      assert FreelancerRate.days_in_budget(4_410, 55, 0.0) == 10.0
      # 10.18182
      assert FreelancerRate.days_in_budget(4_480, 55, 0.0) == 10.1
    end

    @tag :pending
    test "it applies the discount" do
      # 1.25
      assert FreelancerRate.days_in_budget(480, 60, 20) == 1.2
    end
  end
end
