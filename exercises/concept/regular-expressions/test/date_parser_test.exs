defmodule DateParserTest do
  use ExUnit.Case

  describe "numeric pattern for day matches" do
    test "un-padded 1", do: assert "1" =~ Regex.compile!(DateParser.day())
    test "un-padded 2", do: assert "2" =~ Regex.compile!(DateParser.day())
    test "un-padded 3", do: assert "3" =~ Regex.compile!(DateParser.day())
    test "un-padded 4", do: assert "4" =~ Regex.compile!(DateParser.day())
    test "un-padded 5", do: assert "5" =~ Regex.compile!(DateParser.day())
    test "un-padded 6", do: assert "6" =~ Regex.compile!(DateParser.day())
    test "un-padded 7", do: assert "7" =~ Regex.compile!(DateParser.day())
    test "un-padded 8", do: assert "8" =~ Regex.compile!(DateParser.day())
    test "un-padded 9", do: assert "9" =~ Regex.compile!(DateParser.day())
    test "un-padded 10", do: assert "10" =~ Regex.compile!(DateParser.day())
    test "un-padded 11", do: assert "11" =~ Regex.compile!(DateParser.day())
    test "un-padded 12", do: assert "12" =~ Regex.compile!(DateParser.day())
    test "un-padded 13", do: assert "13" =~ Regex.compile!(DateParser.day())
    test "un-padded 14", do: assert "14" =~ Regex.compile!(DateParser.day())
    test "un-padded 15", do: assert "15" =~ Regex.compile!(DateParser.day())
    test "un-padded 16", do: assert "16" =~ Regex.compile!(DateParser.day())
    test "un-padded 17", do: assert "17" =~ Regex.compile!(DateParser.day())
    test "un-padded 18", do: assert "18" =~ Regex.compile!(DateParser.day())
    test "un-padded 19", do: assert "19" =~ Regex.compile!(DateParser.day())
    test "un-padded 20", do: assert "20" =~ Regex.compile!(DateParser.day())
    test "un-padded 21", do: assert "21" =~ Regex.compile!(DateParser.day())
    test "un-padded 22", do: assert "22" =~ Regex.compile!(DateParser.day())
    test "un-padded 23", do: assert "23" =~ Regex.compile!(DateParser.day())
    test "un-padded 24", do: assert "24" =~ Regex.compile!(DateParser.day())
    test "un-padded 25", do: assert "25" =~ Regex.compile!(DateParser.day())
    test "un-padded 26", do: assert "26" =~ Regex.compile!(DateParser.day())
    test "un-padded 27", do: assert "27" =~ Regex.compile!(DateParser.day())
    test "un-padded 28", do: assert "28" =~ Regex.compile!(DateParser.day())
    test "un-padded 29", do: assert "29" =~ Regex.compile!(DateParser.day())
    test "un-padded 30", do: assert "30" =~ Regex.compile!(DateParser.day())
    test "un-padded 31", do: assert "31" =~ Regex.compile!(DateParser.day())

    test "padded 01", do: assert "01" =~ Regex.compile!(DateParser.day())
    test "padded 02", do: assert "02" =~ Regex.compile!(DateParser.day())
    test "padded 03", do: assert "03" =~ Regex.compile!(DateParser.day())
    test "padded 04", do: assert "04" =~ Regex.compile!(DateParser.day())
    test "padded 05", do: assert "05" =~ Regex.compile!(DateParser.day())
    test "padded 06", do: assert "06" =~ Regex.compile!(DateParser.day())
    test "padded 07", do: assert "07" =~ Regex.compile!(DateParser.day())
    @tag :pending
    test "padded 08", do: assert "08" =~ Regex.compile!(DateParser.day())
    @tag :pending
    test "padded 09", do: assert "09" =~ Regex.compile!(DateParser.day())
  end

  describe "numeric pattern for day doesn't match" do
    @tag :pending
    test "too few digits", do: refute "" =~ Regex.compile!("^#{DateParser.day()}$")
    @tag :pending
    test "too many digits", do: refute "111" =~ Regex.compile!("^#{DateParser.day()}$")
    @tag :pending
    test "one letter", do: refute "a" =~ Regex.compile!(DateParser.day())
    @tag :pending
    test "two letters", do: refute "bb" =~ Regex.compile!(DateParser.day())
  end

  describe "numeric pattern for month matches" do
    @tag :pending
    test "un-padded 1", do: assert "1" =~ Regex.compile!(DateParser.month())
    @tag :pending
    test "un-padded 2", do: assert "2" =~ Regex.compile!(DateParser.month())
    @tag :pending
    test "un-padded 3", do: assert "3" =~ Regex.compile!(DateParser.month())
    @tag :pending
    test "un-padded 4", do: assert "4" =~ Regex.compile!(DateParser.month())
    @tag :pending
    test "un-padded 5", do: assert "5" =~ Regex.compile!(DateParser.month())
    @tag :pending
    test "un-padded 6", do: assert "6" =~ Regex.compile!(DateParser.month())
    @tag :pending
    test "un-padded 7", do: assert "7" =~ Regex.compile!(DateParser.month())
    @tag :pending
    test "un-padded 8", do: assert "8" =~ Regex.compile!(DateParser.month())
    @tag :pending
    test "un-padded 9", do: assert "9" =~ Regex.compile!(DateParser.month())
    @tag :pending
    test "un-padded 10", do: assert "10" =~ Regex.compile!(DateParser.month())
    @tag :pending
    test "un-padded 11", do: assert "11" =~ Regex.compile!(DateParser.month())
    @tag :pending
    test "un-padded 12", do: assert "11" =~ Regex.compile!(DateParser.month())

    @tag :pending
    test "padded 01", do: assert "01" =~ Regex.compile!(DateParser.month())
    @tag :pending
    test "padded 02", do: assert "02" =~ Regex.compile!(DateParser.month())
    @tag :pending
    test "padded 03", do: assert "03" =~ Regex.compile!(DateParser.month())
    @tag :pending
    test "padded 04", do: assert "04" =~ Regex.compile!(DateParser.month())
    @tag :pending
    test "padded 05", do: assert "05" =~ Regex.compile!(DateParser.month())
    @tag :pending
    test "padded 06", do: assert "06" =~ Regex.compile!(DateParser.month())
    @tag :pending
    test "padded 07", do: assert "07" =~ Regex.compile!(DateParser.month())
    @tag :pending
    test "padded 08", do: assert "08" =~ Regex.compile!(DateParser.month())
    @tag :pending
    test "padded 09", do: assert "09" =~ Regex.compile!(DateParser.month())
  end

  describe "numeric pattern for month doesn't match" do
    @tag :pending
    test "too few digits", do: refute "" =~ Regex.compile!("^#{DateParser.month()}$")
    @tag :pending
    test "too many digits", do: refute "111" =~ Regex.compile!("^#{DateParser.month()}$")
    @tag :pending
    test "one letter", do: refute "a" =~ Regex.compile!(DateParser.month())
    @tag :pending
    test "two letters", do: refute "bb" =~ Regex.compile!(DateParser.month())
    @tag :pending
    test "short month name", do: refute "Jan" =~ Regex.compile!(DateParser.month())
    @tag :pending
    test "long month name", do: refute "January" =~ Regex.compile!(DateParser.month())
  end

  describe "numeric pattern for year" do
    @tag :pending
    test "matches 4 digits", do: assert "1970" =~ Regex.compile!("^#{DateParser.year()}$")
    @tag :pending
    test "doesn't match short year", do: refute "84" =~ Regex.compile!("^#{DateParser.year()}$")
    @tag :pending
    test "doesn't match letters", do: refute "198A" =~ Regex.compile!("^#{DateParser.year()}$")
    @tag :pending
    test "doesn't match too few", do: refute "198" =~ Regex.compile!("^#{DateParser.year()}$")
    @tag :pending
    test "doesn't match too many", do: refute "19701" =~ Regex.compile!("^#{DateParser.year()}$")
  end

  describe "day names match" do
    @tag :pending
    test "Sunday", do: assert "Sunday" =~ Regex.compile!(DateParser.day_names())
    @tag :pending
    test "Monday", do: assert "Monday" =~ Regex.compile!(DateParser.day_names())
    @tag :pending
    test "Tuesday", do: assert "Tuesday" =~ Regex.compile!(DateParser.day_names())
    @tag :pending
    test "Wednesday", do: assert "Wednesday" =~ Regex.compile!(DateParser.day_names())
    @tag :pending
    test "Thursday", do: assert "Thursday" =~ Regex.compile!(DateParser.day_names())
    @tag :pending
    test "Friday", do: assert "Friday" =~ Regex.compile!(DateParser.day_names())
    @tag :pending
    test "Saturday", do: assert "Saturday" =~ Regex.compile!(DateParser.day_names())
  end

  describe "day names don't match" do
    @tag :pending
    test "combined" do
      refute "SundayMonday" =~ Regex.compile!("^#{DateParser.day_names()}$")
    end

    @tag :pending
    test "short name" do
      refute "Sun" =~ Regex.compile!("^#{DateParser.day_names()}$")
    end

    @tag :pending
    test "numeric day of the week (0-indexed)" do
      refute "0" =~ Regex.compile!("^#{DateParser.day_names()}$")
    end

    @tag :pending
    test "numeric day of the week (1-indexed)" do
      refute "1" =~ Regex.compile!("^#{DateParser.day_names()}$")
    end
  end

  describe "month names match" do
    @tag :pending
    test "January", do: assert "January" =~ Regex.compile!(DateParser.month_names())
    @tag :pending
    test "February", do: assert "February" =~ Regex.compile!(DateParser.month_names())
    @tag :pending
    test "March", do: assert "March" =~ Regex.compile!(DateParser.month_names())
    @tag :pending
    test "April", do: assert "April" =~ Regex.compile!(DateParser.month_names())
    @tag :pending
    test "May", do: assert "May" =~ Regex.compile!(DateParser.month_names())
    @tag :pending
    test "June", do: assert "June" =~ Regex.compile!(DateParser.month_names())
    @tag :pending
    test "July", do: assert "July" =~ Regex.compile!(DateParser.month_names())
    @tag :pending
    test "August", do: assert "August" =~ Regex.compile!(DateParser.month_names())
    @tag :pending
    test "September", do: assert "September" =~ Regex.compile!(DateParser.month_names())
    @tag :pending
    test "October", do: assert "October" =~ Regex.compile!(DateParser.month_names())
    @tag :pending
    test "November", do: assert "November" =~ Regex.compile!(DateParser.month_names())
    @tag :pending
    test "December", do: assert "December" =~ Regex.compile!(DateParser.month_names())
  end

  describe "month names don't match" do
    @tag :pending
    test "combined" do
      refute "JanuaryFebruary" =~ Regex.compile!("^#{DateParser.month_names()}$")
    end

    @tag :pending
    test "short name" do
      refute "Jan" =~ Regex.compile!("^#{DateParser.month_names()}$")
    end

    @tag :pending
    test "numeric month of the year (0-indexed)" do
      refute "0" =~ Regex.compile!("^#{DateParser.month_names()}$")
    end

    @tag :pending
    test "numeric month of the year (1-indexed)" do
      refute "1" =~ Regex.compile!("^#{DateParser.month_names()}$")
    end
  end

  describe "capture" do
    @tag :pending
    test "numeric month" do
      assert %{"month" => "01"} =
        DateParser.capture_month()
        |> Regex.compile!()
        |> Regex.named_captures("01")
    end

    @tag :pending
    test "numeric day" do
      assert %{"day" => "01"} =
        DateParser.capture_day()
        |> Regex.compile!()
        |> Regex.named_captures("01")
    end

    @tag :pending
    test "numeric year" do
      assert %{"year" => "1970"} =
        DateParser.capture_year()
        |> Regex.compile!()
        |> Regex.named_captures("1970")
    end

    @tag :pending
    test "capture day name" do
      assert %{"day_name" => "Monday"} =
        DateParser.capture_day_name()
        |> Regex.compile!()
        |> Regex.named_captures("Monday")
    end

    @tag :pending
    test "capture month name" do
      assert %{"month_name" => "February"} =
        DateParser.capture_month_name()
        |> Regex.compile!()
        |> Regex.named_captures("February")
    end

    @tag :pending
    test "numeric date" do
      assert %{"year" => "1970", "month" => "02", "day" => "01"} =
        DateParser.capture_numeric_date()
        |> Regex.compile!()
        |> Regex.named_captures("01/02/1970")
    end

    @tag :pending
    test "month named date" do
      assert %{"year" => "1970", "month_name" => "January", "day" => "1"} =
        DateParser.capture_month_name_date()
        |> Regex.compile!()
        |> Regex.named_captures("January 1, 1970")
    end

    @tag :pending
    test "day and month named date" do
      assert %{"year" => "1970", "month_name" => "January", "day" => "1", "day_name" => "Thursday"} =
        DateParser.capture_day_month_name_date()
        |> Regex.compile!()
        |> Regex.named_captures("Thursday, January 1, 1970")
    end
  end

  describe "regex match" do
    @tag :pending
    test "numeric date" do
      assert %{"year" => "1970", "month" => "02", "day" => "01"} =
        DateParser.match_numeric_date()
        |> Regex.named_captures("01/02/1970")
    end

    @tag :pending
    test "month named date" do
      assert %{"year" => "1970", "month_name" => "January", "day" => "1"} =
        DateParser.match_month_name_date()
        |> Regex.named_captures("January 1, 1970")
    end

    @tag :pending
    test "day and month named date" do
      assert %{"year" => "1970", "month_name" => "January", "day" => "1", "day_name" => "Thursday"} =
        DateParser.match_day_month_name_date()
        |> Regex.named_captures("Thursday, January 1, 1970")
    end
  end
end
