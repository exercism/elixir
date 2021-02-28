defmodule ClockTest do
  use ExUnit.Case

  # @tag :pending
  test "to_string" do
    try do
      to_string(%Clock{})
    rescue
      Protocol.UndefinedError ->
        refute(true, """
        Can't convert Clock to string.
        Hint: implement the String.Chars protocol for Clock.
        http://elixir-lang.org/getting-started/protocols.html
        https://hexdocs.pm/elixir/String.Chars.html
        """)
    end
  end

  describe "create" do
    @tag :pending
    test "on the hour" do
      assert Clock.new(8, 0) |> to_string == "08:00"
    end

    @tag :pending
    test "past the hour" do
      assert Clock.new(11, 9) |> to_string == "11:09"
    end

    @tag :pending
    test "midnight is zero hours" do
      assert Clock.new(24, 0) |> to_string == "00:00"
    end

    @tag :pending
    test "hour rolls over" do
      assert Clock.new(25, 0) |> to_string == "01:00"
    end

    @tag :pending
    test "hour rolls over continuously" do
      assert Clock.new(100, 0) |> to_string == "04:00"
    end

    @tag :pending
    test "sixty minutes is next hour" do
      assert Clock.new(1, 60) |> to_string == "02:00"
    end

    @tag :pending
    test "minutes roll over" do
      assert Clock.new(0, 160) |> to_string == "02:40"
    end

    @tag :pending
    test "minutes roll over continuously" do
      assert Clock.new(0, 1723) |> to_string == "04:43"
    end

    @tag :pending
    test "hour and minutes roll over" do
      assert Clock.new(25, 160) |> to_string == "03:40"
    end

    @tag :pending
    test "hour and minutes roll over continuously" do
      assert Clock.new(201, 3001) |> to_string == "11:01"
    end

    @tag :pending
    test "hour and minutes roll over to exactly midnight" do
      assert Clock.new(72, 8640) |> to_string == "00:00"
    end

    @tag :pending
    test "negative hour" do
      assert Clock.new(-1, 15) |> to_string == "23:15"
    end

    @tag :pending
    test "negative hour rolls over" do
      assert Clock.new(-25, 0) |> to_string == "23:00"
    end

    @tag :pending
    test "negative hour rolls over continuously" do
      assert Clock.new(-91, 0) |> to_string == "05:00"
    end

    @tag :pending
    test "negative minutes" do
      assert Clock.new(1, -40) |> to_string == "00:20"
    end

    @tag :pending
    test "negative minutes roll over" do
      assert Clock.new(1, -160) |> to_string == "22:20"
    end

    @tag :pending
    test "negative minutes roll over continuously" do
      assert Clock.new(1, -4820) |> to_string == "16:40"
    end

    @tag :pending
    test "negative sixty minutes is previous hour" do
      assert Clock.new(2, -60) |> to_string == "01:00"
    end

    @tag :pending
    test "negative hour and minutes roll over" do
      assert Clock.new(-25, -160) |> to_string == "20:20"
    end

    @tag :pending
    test "negative hour and minutes roll over continuously" do
      assert Clock.new(-121, -5810) |> to_string == "22:10"
    end
  end

  describe "add" do
    @tag :pending
    test "add minutes" do
      assert Clock.new(10, 0) |> Clock.add(3) |> to_string == "10:03"
    end

    @tag :pending
    test "add no minutes" do
      assert Clock.new(6, 41) |> Clock.add(0) |> to_string == "06:41"
    end

    @tag :pending
    test "add to next hour" do
      assert Clock.new(0, 45) |> Clock.add(40) |> to_string == "01:25"
    end

    @tag :pending
    test "add more than one hour" do
      assert Clock.new(10, 0) |> Clock.add(61) |> to_string == "11:01"
    end

    @tag :pending
    test "add more than two hours with carry" do
      assert Clock.new(0, 45) |> Clock.add(160) |> to_string == "03:25"
    end

    @tag :pending
    test "add across midnight" do
      assert Clock.new(23, 59) |> Clock.add(2) |> to_string == "00:01"
    end

    @tag :pending
    test "add more than one day (1500 min = 25 hrs)" do
      assert Clock.new(5, 32) |> Clock.add(1500) |> to_string == "06:32"
    end

    @tag :pending
    test "add more than two days" do
      assert Clock.new(1, 1) |> Clock.add(3500) |> to_string == "11:21"
    end

    @tag :pending
    test "subtract minutes" do
      assert Clock.new(10, 3) |> Clock.add(-3) |> to_string == "10:00"
    end

    @tag :pending
    test "subtract to previous hour" do
      assert Clock.new(10, 3) |> Clock.add(-30) |> to_string == "09:33"
    end

    @tag :pending
    test "subtract more than an hour" do
      assert Clock.new(10, 3) |> Clock.add(-70) |> to_string == "08:53"
    end

    @tag :pending
    test "subtract across midnight" do
      assert Clock.new(0, 3) |> Clock.add(-4) |> to_string == "23:59"
    end

    @tag :pending
    test "subtract more than two hours" do
      assert Clock.new(0, 0) |> Clock.add(-160) |> to_string == "21:20"
    end

    @tag :pending
    test "subtract more than two hours with borrow" do
      assert Clock.new(6, 15) |> Clock.add(-160) |> to_string == "03:35"
    end

    @tag :pending
    test "subtract more than one day (1500 min = 25 hrs)" do
      assert Clock.new(5, 32) |> Clock.add(-1500) |> to_string == "04:32"
    end

    @tag :pending
    test "subtract more than two days" do
      assert Clock.new(2, 20) |> Clock.add(-3000) |> to_string == "00:20"
    end
  end

  describe "==" do
    @tag :pending
    test "clocks with same time" do
      assert Clock.new(15, 37) == Clock.new(15, 37)
    end

    @tag :pending
    test "clocks a minute apart" do
      refute Clock.new(15, 36) == Clock.new(15, 37)
    end

    @tag :pending
    test "clocks an hour apart" do
      refute Clock.new(14, 37) == Clock.new(15, 37)
    end

    @tag :pending
    test "clocks with hour overflow" do
      assert Clock.new(10, 37) == Clock.new(34, 37)
    end

    @tag :pending
    test "clocks with hour overflow by several days" do
      assert Clock.new(3, 11) == Clock.new(99, 11)
    end

    @tag :pending
    test "clocks with negative hour" do
      assert Clock.new(22, 40) == Clock.new(-2, 40)
    end

    @tag :pending
    test "clocks with negative hour that wraps" do
      assert Clock.new(17, 3) == Clock.new(-31, 3)
    end

    @tag :pending
    test "clocks with negative hour that wraps multiple times" do
      assert Clock.new(13, 49) == Clock.new(-83, 49)
    end

    @tag :pending
    test "clocks with minute overflow" do
      assert Clock.new(0, 1) == Clock.new(0, 1441)
    end

    @tag :pending
    test "clocks with minute overflow by several days" do
      assert Clock.new(2, 2) == Clock.new(2, 4322)
    end

    @tag :pending
    test "clocks with negative minute" do
      assert Clock.new(2, 40) == Clock.new(3, -20)
    end

    @tag :pending
    test "clocks with negative minute that wraps" do
      assert Clock.new(4, 10) == Clock.new(5, -1490)
    end

    @tag :pending
    test "clocks with negative minute that wraps multiple times" do
      assert Clock.new(6, 15) == Clock.new(6, -4305)
    end

    @tag :pending
    test "clocks with negative hours and minutes" do
      assert Clock.new(7, 32) == Clock.new(-12, -268)
    end

    @tag :pending
    test "clocks with negative hours and minutes that wrap" do
      assert Clock.new(18, 7) == Clock.new(-54, -11513)
    end

    @tag :pending
    test "full clock and zeroed clock" do
      assert Clock.new(24, 0) == Clock.new(0, 0)
    end
  end
end
