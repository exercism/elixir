defmodule DateParserTest do
  use ExUnit.Case

  describe "numeric pattern for day matches" do
    @tag task_id: 1
    test "un-padded 1", do: assert("1" =~ Regex.compile!(DateParser.day()))
    @tag task_id: 1
    test "un-padded 2", do: assert("2" =~ Regex.compile!(DateParser.day()))
    @tag task_id: 1
    test "un-padded 3", do: assert("3" =~ Regex.compile!(DateParser.day()))
    @tag task_id: 1
    test "un-padded 4", do: assert("4" =~ Regex.compile!(DateParser.day()))
    @tag task_id: 1
    test "un-padded 5", do: assert("5" =~ Regex.compile!(DateParser.day()))
    @tag task_id: 1
    test "un-padded 6", do: assert("6" =~ Regex.compile!(DateParser.day()))
    @tag task_id: 1
    test "un-padded 7", do: assert("7" =~ Regex.compile!(DateParser.day()))
    @tag task_id: 1
    test "un-padded 8", do: assert("8" =~ Regex.compile!(DateParser.day()))
    @tag task_id: 1
    test "un-padded 9", do: assert("9" =~ Regex.compile!(DateParser.day()))
    @tag task_id: 1
    test "un-padded 10", do: assert("10" =~ Regex.compile!(DateParser.day()))
    @tag task_id: 1
    test "un-padded 11", do: assert("11" =~ Regex.compile!(DateParser.day()))
    @tag task_id: 1
    test "un-padded 12", do: assert("12" =~ Regex.compile!(DateParser.day()))
    @tag task_id: 1
    test "un-padded 13", do: assert("13" =~ Regex.compile!(DateParser.day()))
    @tag task_id: 1
    test "un-padded 14", do: assert("14" =~ Regex.compile!(DateParser.day()))
    @tag task_id: 1
    test "un-padded 15", do: assert("15" =~ Regex.compile!(DateParser.day()))
    @tag task_id: 1
    test "un-padded 16", do: assert("16" =~ Regex.compile!(DateParser.day()))
    @tag task_id: 1
    test "un-padded 17", do: assert("17" =~ Regex.compile!(DateParser.day()))
    @tag task_id: 1
    test "un-padded 18", do: assert("18" =~ Regex.compile!(DateParser.day()))
    @tag task_id: 1
    test "un-padded 19", do: assert("19" =~ Regex.compile!(DateParser.day()))
    @tag task_id: 1
    test "un-padded 20", do: assert("20" =~ Regex.compile!(DateParser.day()))
    @tag task_id: 1
    test "un-padded 21", do: assert("21" =~ Regex.compile!(DateParser.day()))
    @tag task_id: 1
    test "un-padded 22", do: assert("22" =~ Regex.compile!(DateParser.day()))
    @tag task_id: 1
    test "un-padded 23", do: assert("23" =~ Regex.compile!(DateParser.day()))
    @tag task_id: 1
    test "un-padded 24", do: assert("24" =~ Regex.compile!(DateParser.day()))
    @tag task_id: 1
    test "un-padded 25", do: assert("25" =~ Regex.compile!(DateParser.day()))
    @tag task_id: 1
    test "un-padded 26", do: assert("26" =~ Regex.compile!(DateParser.day()))
    @tag task_id: 1
    test "un-padded 27", do: assert("27" =~ Regex.compile!(DateParser.day()))
    @tag task_id: 1
    test "un-padded 28", do: assert("28" =~ Regex.compile!(DateParser.day()))
    @tag task_id: 1
    test "un-padded 29", do: assert("29" =~ Regex.compile!(DateParser.day()))
    @tag task_id: 1
    test "un-padded 30", do: assert("30" =~ Regex.compile!(DateParser.day()))
    @tag task_id: 1
    test "un-padded 31", do: assert("31" =~ Regex.compile!(DateParser.day()))

    @tag task_id: 1
    test "padded 01", do: assert("01" =~ Regex.compile!(DateParser.day()))
    @tag task_id: 1
    test "padded 02", do: assert("02" =~ Regex.compile!(DateParser.day()))
    @tag task_id: 1
    test "padded 03", do: assert("03" =~ Regex.compile!(DateParser.day()))
    @tag task_id: 1
    test "padded 04", do: assert("04" =~ Regex.compile!(DateParser.day()))
    @tag task_id: 1
    test "padded 05", do: assert("05" =~ Regex.compile!(DateParser.day()))
    @tag task_id: 1
    test "padded 06", do: assert("06" =~ Regex.compile!(DateParser.day()))
    @tag task_id: 1
    test "padded 07", do: assert("07" =~ Regex.compile!(DateParser.day()))
    @tag task_id: 1
    test "padded 08", do: assert("08" =~ Regex.compile!(DateParser.day()))
    @tag task_id: 1
    test "padded 09", do: assert("09" =~ Regex.compile!(DateParser.day()))
  end

  describe "numeric pattern for day doesn't match" do
    @tag task_id: 1
    test "too few digits", do: refute("" =~ Regex.compile!("^#{DateParser.day()}$"))
    @tag task_id: 1
    test "too many digits", do: refute("111" =~ Regex.compile!("^#{DateParser.day()}$"))
    @tag task_id: 1
    test "one letter", do: refute("a" =~ Regex.compile!(DateParser.day()))
    @tag task_id: 1
    test "two letters", do: refute("bb" =~ Regex.compile!(DateParser.day()))
  end

  describe "numeric pattern for month matches" do
    @tag task_id: 1
    test "un-padded 1", do: assert("1" =~ Regex.compile!(DateParser.month()))
    @tag task_id: 1
    test "un-padded 2", do: assert("2" =~ Regex.compile!(DateParser.month()))
    @tag task_id: 1
    test "un-padded 3", do: assert("3" =~ Regex.compile!(DateParser.month()))
    @tag task_id: 1
    test "un-padded 4", do: assert("4" =~ Regex.compile!(DateParser.month()))
    @tag task_id: 1
    test "un-padded 5", do: assert("5" =~ Regex.compile!(DateParser.month()))
    @tag task_id: 1
    test "un-padded 6", do: assert("6" =~ Regex.compile!(DateParser.month()))
    @tag task_id: 1
    test "un-padded 7", do: assert("7" =~ Regex.compile!(DateParser.month()))
    @tag task_id: 1
    test "un-padded 8", do: assert("8" =~ Regex.compile!(DateParser.month()))
    @tag task_id: 1
    test "un-padded 9", do: assert("9" =~ Regex.compile!(DateParser.month()))
    @tag task_id: 1
    test "un-padded 10", do: assert("10" =~ Regex.compile!(DateParser.month()))
    @tag task_id: 1
    test "un-padded 11", do: assert("11" =~ Regex.compile!(DateParser.month()))
    @tag task_id: 1
    test "un-padded 12", do: assert("11" =~ Regex.compile!(DateParser.month()))

    @tag task_id: 1
    test "padded 01", do: assert("01" =~ Regex.compile!(DateParser.month()))
    @tag task_id: 1
    test "padded 02", do: assert("02" =~ Regex.compile!(DateParser.month()))
    @tag task_id: 1
    test "padded 03", do: assert("03" =~ Regex.compile!(DateParser.month()))
    @tag task_id: 1
    test "padded 04", do: assert("04" =~ Regex.compile!(DateParser.month()))
    @tag task_id: 1
    test "padded 05", do: assert("05" =~ Regex.compile!(DateParser.month()))
    @tag task_id: 1
    test "padded 06", do: assert("06" =~ Regex.compile!(DateParser.month()))
    @tag task_id: 1
    test "padded 07", do: assert("07" =~ Regex.compile!(DateParser.month()))
    @tag task_id: 1
    test "padded 08", do: assert("08" =~ Regex.compile!(DateParser.month()))
    @tag task_id: 1
    test "padded 09", do: assert("09" =~ Regex.compile!(DateParser.month()))
  end

  describe "numeric pattern for month doesn't match" do
    @tag task_id: 1
    test "too few digits", do: refute("" =~ Regex.compile!("^#{DateParser.month()}$"))
    @tag task_id: 1
    test "too many digits", do: refute("111" =~ Regex.compile!("^#{DateParser.month()}$"))
    @tag task_id: 1
    test "one letter", do: refute("a" =~ Regex.compile!(DateParser.month()))
    @tag task_id: 1
    test "two letters", do: refute("bb" =~ Regex.compile!(DateParser.month()))
    @tag task_id: 1
    test "short month name", do: refute("Jan" =~ Regex.compile!(DateParser.month()))
    @tag task_id: 1
    test "long month name", do: refute("January" =~ Regex.compile!(DateParser.month()))
  end

  describe "numeric pattern for year" do
    @tag task_id: 1
    test "matches 4 digits", do: assert("1970" =~ Regex.compile!("^#{DateParser.year()}$"))
    @tag task_id: 1
    test "doesn't match short year", do: refute("84" =~ Regex.compile!("^#{DateParser.year()}$"))
    @tag task_id: 1
    test "doesn't match letters", do: refute("198A" =~ Regex.compile!("^#{DateParser.year()}$"))
    @tag task_id: 1
    test "doesn't match too few", do: refute("198" =~ Regex.compile!("^#{DateParser.year()}$"))
    @tag task_id: 1
    test "doesn't match too many", do: refute("19701" =~ Regex.compile!("^#{DateParser.year()}$"))
  end

  describe "day names match" do
    @tag task_id: 2
    test "Sunday", do: assert("Sunday" =~ Regex.compile!(DateParser.day_names()))
    @tag task_id: 2
    test "Monday", do: assert("Monday" =~ Regex.compile!(DateParser.day_names()))
    @tag task_id: 2
    test "Tuesday", do: assert("Tuesday" =~ Regex.compile!(DateParser.day_names()))
    @tag task_id: 2
    test "Wednesday", do: assert("Wednesday" =~ Regex.compile!(DateParser.day_names()))
    @tag task_id: 2
    test "Thursday", do: assert("Thursday" =~ Regex.compile!(DateParser.day_names()))
    @tag task_id: 2
    test "Friday", do: assert("Friday" =~ Regex.compile!(DateParser.day_names()))
    @tag task_id: 2
    test "Saturday", do: assert("Saturday" =~ Regex.compile!(DateParser.day_names()))
  end

  describe "day names don't match with trailing or leading whitespace" do
    @tag task_id: 2
    test "Sunday", do: refute(" Sunday " =~ Regex.compile!("^#{DateParser.day_names()}$"))
    @tag task_id: 2
    test "Monday", do: refute(" Monday " =~ Regex.compile!("^#{DateParser.day_names()}$"))
    @tag task_id: 2
    test "Tuesday", do: refute(" Tuesday " =~ Regex.compile!("^#{DateParser.day_names()}$"))
    @tag task_id: 2
    test "Wednesday", do: refute(" Wednesday " =~ Regex.compile!("^#{DateParser.day_names()}$"))
    @tag task_id: 2
    test "Thursday", do: refute(" Thursday " =~ Regex.compile!("^#{DateParser.day_names()}$"))
    @tag task_id: 2
    test "Friday", do: refute(" Friday " =~ Regex.compile!("^#{DateParser.day_names()}$"))
    @tag task_id: 2
    test "Saturday", do: refute(" Saturday " =~ Regex.compile!("^#{DateParser.day_names()}$"))
  end

  describe "day names don't match" do
    @tag task_id: 2
    test "combined" do
      refute "TuesdayWednesday" =~ Regex.compile!("^#{DateParser.day_names()}$")
    end

    @tag task_id: 2
    test "short name" do
      refute "Sun" =~ Regex.compile!("^#{DateParser.day_names()}$")
    end

    @tag task_id: 2
    test "numeric day of the week (0-indexed)" do
      refute "0" =~ Regex.compile!("^#{DateParser.day_names()}$")
    end

    @tag task_id: 2
    test "numeric day of the week (1-indexed)" do
      refute "1" =~ Regex.compile!("^#{DateParser.day_names()}$")
    end
  end

  describe "month names match" do
    @tag task_id: 2
    test "January", do: assert("January" =~ Regex.compile!(DateParser.month_names()))
    @tag task_id: 2
    test "February", do: assert("February" =~ Regex.compile!(DateParser.month_names()))
    @tag task_id: 2
    test "March", do: assert("March" =~ Regex.compile!(DateParser.month_names()))
    @tag task_id: 2
    test "April", do: assert("April" =~ Regex.compile!(DateParser.month_names()))
    @tag task_id: 2
    test "May", do: assert("May" =~ Regex.compile!(DateParser.month_names()))
    @tag task_id: 2
    test "June", do: assert("June" =~ Regex.compile!(DateParser.month_names()))
    @tag task_id: 2
    test "July", do: assert("July" =~ Regex.compile!(DateParser.month_names()))
    @tag task_id: 2
    test "August", do: assert("August" =~ Regex.compile!(DateParser.month_names()))
    @tag task_id: 2
    test "September", do: assert("September" =~ Regex.compile!(DateParser.month_names()))
    @tag task_id: 2
    test "October", do: assert("October" =~ Regex.compile!(DateParser.month_names()))
    @tag task_id: 2
    test "November", do: assert("November" =~ Regex.compile!(DateParser.month_names()))
    @tag task_id: 2
    test "December", do: assert("December" =~ Regex.compile!(DateParser.month_names()))
  end

  describe "month names don't match with trailing or leading whitespace" do
    @tag task_id: 2
    test "January", do: refute(" January " =~ Regex.compile!("^#{DateParser.month_names()}$"))
    @tag task_id: 2
    test "February", do: refute(" February " =~ Regex.compile!("^#{DateParser.month_names()}$"))
    @tag task_id: 2
    test "March", do: refute(" March " =~ Regex.compile!("^#{DateParser.month_names()}$"))
    @tag task_id: 2
    test "April", do: refute(" April " =~ Regex.compile!("^#{DateParser.month_names()}$"))
    @tag task_id: 2
    test "May", do: refute(" May " =~ Regex.compile!("^#{DateParser.month_names()}$"))
    @tag task_id: 2
    test "June", do: refute(" June " =~ Regex.compile!("^#{DateParser.month_names()}$"))
    @tag task_id: 2
    test "July", do: refute(" July " =~ Regex.compile!("^#{DateParser.month_names()}$"))
    @tag task_id: 2
    test "August", do: refute(" August " =~ Regex.compile!("^#{DateParser.month_names()}$"))
    @tag task_id: 2
    test "September", do: refute(" September " =~ Regex.compile!("^#{DateParser.month_names()}$"))
    @tag task_id: 2
    test "October", do: refute(" October " =~ Regex.compile!("^#{DateParser.month_names()}$"))
    @tag task_id: 2
    test "November", do: refute(" November " =~ Regex.compile!("^#{DateParser.month_names()}$"))
    @tag task_id: 2
    test "December", do: refute(" December " =~ Regex.compile!("^#{DateParser.month_names()}$"))
  end

  describe "month names don't match" do
    @tag task_id: 2
    test "combined" do
      refute "JanuaryFebruary" =~ Regex.compile!("^#{DateParser.month_names()}$")
    end

    @tag task_id: 2
    test "short name" do
      refute "Jan" =~ Regex.compile!("^#{DateParser.month_names()}$")
    end

    @tag task_id: 2
    test "numeric month of the year (0-indexed)" do
      refute "0" =~ Regex.compile!("^#{DateParser.month_names()}$")
    end

    @tag task_id: 2
    test "numeric month of the year (1-indexed)" do
      refute "1" =~ Regex.compile!("^#{DateParser.month_names()}$")
    end
  end

  describe "capture" do
    @tag task_id: 3
    test "numeric month" do
      assert %{"month" => "01"} =
               DateParser.capture_month()
               |> Regex.compile!()
               |> Regex.named_captures("01")
    end

    @tag task_id: 3
    test "numeric day" do
      assert %{"day" => "01"} =
               DateParser.capture_day()
               |> Regex.compile!()
               |> Regex.named_captures("01")
    end

    @tag task_id: 3
    test "numeric year" do
      assert %{"year" => "1970"} =
               DateParser.capture_year()
               |> Regex.compile!()
               |> Regex.named_captures("1970")
    end

    @tag task_id: 3
    test "capture day name" do
      assert %{"day_name" => "Monday"} =
               DateParser.capture_day_name()
               |> Regex.compile!()
               |> Regex.named_captures("Monday")
    end

    @tag task_id: 3
    test "capture month name" do
      assert %{"month_name" => "February"} =
               DateParser.capture_month_name()
               |> Regex.compile!()
               |> Regex.named_captures("February")
    end

    @tag task_id: 4
    test "numeric date" do
      assert %{"year" => "1970", "month" => "02", "day" => "01"} =
               DateParser.capture_numeric_date()
               |> Regex.compile!()
               |> Regex.named_captures("01/02/1970")
    end

    @tag task_id: 4
    test "month named date" do
      assert %{"year" => "1970", "month_name" => "January", "day" => "1"} =
               DateParser.capture_month_name_date()
               |> Regex.compile!()
               |> Regex.named_captures("January 1, 1970")
    end

    @tag task_id: 4
    test "day and month named date" do
      assert %{
               "year" => "1970",
               "month_name" => "January",
               "day" => "1",
               "day_name" => "Thursday"
             } =
               DateParser.capture_day_month_name_date()
               |> Regex.compile!()
               |> Regex.named_captures("Thursday, January 1, 1970")
    end
  end

  describe "regex match" do
    @tag task_id: 5
    test "numeric date matches" do
      assert DateParser.match_numeric_date() |> Regex.match?("01/02/1970")
    end

    @tag task_id: 5
    test "numeric date has named captures" do
      assert %{"year" => "1970", "month" => "02", "day" => "01"} =
               DateParser.match_numeric_date()
               |> Regex.named_captures("01/02/1970")
    end

    @tag task_id: 5
    test "numeric date with a prefix doesn't match" do
      refute DateParser.match_numeric_date() |> Regex.match?("The day was 01/02/1970")
    end

    @tag task_id: 5
    test "numeric date with a suffix doesn't match" do
      refute DateParser.match_numeric_date() |> Regex.match?("01/02/1970 was the day")
    end

    @tag task_id: 5
    test "month named date matches" do
      assert DateParser.match_month_name_date() |> Regex.match?("January 1, 1970")
    end

    @tag task_id: 5
    test "month named date has named captures" do
      assert %{"year" => "1970", "month_name" => "January", "day" => "1"} =
               DateParser.match_month_name_date()
               |> Regex.named_captures("January 1, 1970")
    end

    @tag task_id: 5
    test "month named date with a prefix doesn't match" do
      refute DateParser.match_month_name_date() |> Regex.match?("The day was January 1, 1970")
    end

    @tag task_id: 5
    test "month named date with a suffix doesn't match" do
      refute DateParser.match_month_name_date() |> Regex.match?("January 1, 1970 was the day")
    end

    @tag task_id: 5
    test "day and month names date matches" do
      assert DateParser.match_day_month_name_date() |> Regex.match?("Thursday, January 1, 1970")
    end

    @tag task_id: 5
    test "day and month names date has named captures" do
      assert %{
               "year" => "1970",
               "month_name" => "January",
               "day" => "1",
               "day_name" => "Thursday"
             } =
               DateParser.match_day_month_name_date()
               |> Regex.named_captures("Thursday, January 1, 1970")
    end

    @tag task_id: 5
    test "day and month names date with a prefix doesn't match" do
      refute DateParser.match_day_month_name_date()
             |> Regex.match?("The day way Thursday, January 1, 1970")
    end

    @tag task_id: 5
    test "day and month names date with a suffix doesn't match" do
      refute DateParser.match_day_month_name_date()
             |> Regex.match?("Thursday, January 1, 1970 was the day")
    end
  end
end
