defmodule DateParserTest do
  use ExUnit.Case

  @tag task_id: 1
  test "numeric pattern for day is a string" do
    assert DateParser.day() |> is_binary()
  end

  describe "numeric pattern for day matches" do
    @tag task_id: 1
    test "un-padded days" do
      assert "1" =~ Regex.compile!(DateParser.day())
      assert "2" =~ Regex.compile!(DateParser.day())
      assert "3" =~ Regex.compile!(DateParser.day())
      assert "4" =~ Regex.compile!(DateParser.day())
      assert "5" =~ Regex.compile!(DateParser.day())
      assert "6" =~ Regex.compile!(DateParser.day())
      assert "7" =~ Regex.compile!(DateParser.day())
      assert "8" =~ Regex.compile!(DateParser.day())
      assert "9" =~ Regex.compile!(DateParser.day())
      assert "10" =~ Regex.compile!(DateParser.day())
      assert "11" =~ Regex.compile!(DateParser.day())
      assert "12" =~ Regex.compile!(DateParser.day())
      assert "13" =~ Regex.compile!(DateParser.day())
      assert "14" =~ Regex.compile!(DateParser.day())
      assert "15" =~ Regex.compile!(DateParser.day())
      assert "16" =~ Regex.compile!(DateParser.day())
      assert "17" =~ Regex.compile!(DateParser.day())
      assert "18" =~ Regex.compile!(DateParser.day())
      assert "19" =~ Regex.compile!(DateParser.day())
      assert "20" =~ Regex.compile!(DateParser.day())
      assert "21" =~ Regex.compile!(DateParser.day())
      assert "22" =~ Regex.compile!(DateParser.day())
      assert "23" =~ Regex.compile!(DateParser.day())
      assert "24" =~ Regex.compile!(DateParser.day())
      assert "25" =~ Regex.compile!(DateParser.day())
      assert "26" =~ Regex.compile!(DateParser.day())
      assert "27" =~ Regex.compile!(DateParser.day())
      assert "28" =~ Regex.compile!(DateParser.day())
      assert "29" =~ Regex.compile!(DateParser.day())
      assert "30" =~ Regex.compile!(DateParser.day())
      assert "31" =~ Regex.compile!(DateParser.day())
    end

    @tag task_id: 1
    test "padded days" do
      assert "01" =~ Regex.compile!(DateParser.day())
      assert "02" =~ Regex.compile!(DateParser.day())
      assert "03" =~ Regex.compile!(DateParser.day())
      assert "04" =~ Regex.compile!(DateParser.day())
      assert "05" =~ Regex.compile!(DateParser.day())
      assert "06" =~ Regex.compile!(DateParser.day())
      assert "07" =~ Regex.compile!(DateParser.day())
      assert "08" =~ Regex.compile!(DateParser.day())
      assert "09" =~ Regex.compile!(DateParser.day())
    end
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

  @tag task_id: 1
  test "numeric pattern for month is a string" do
    assert DateParser.month() |> is_binary()
  end

  describe "numeric pattern for month matches" do
    @tag task_id: 1
    test "un-padded months" do
      assert "1" =~ Regex.compile!(DateParser.month())
      assert "2" =~ Regex.compile!(DateParser.month())
      assert "3" =~ Regex.compile!(DateParser.month())
      assert "4" =~ Regex.compile!(DateParser.month())
      assert "5" =~ Regex.compile!(DateParser.month())
      assert "6" =~ Regex.compile!(DateParser.month())
      assert "7" =~ Regex.compile!(DateParser.month())
      assert "8" =~ Regex.compile!(DateParser.month())
      assert "9" =~ Regex.compile!(DateParser.month())
      assert "10" =~ Regex.compile!(DateParser.month())
      assert "11" =~ Regex.compile!(DateParser.month())
      assert "12" =~ Regex.compile!(DateParser.month())
    end

    @tag task_id: 1
    test "padded months" do
      assert "01" =~ Regex.compile!(DateParser.month())
      assert "02" =~ Regex.compile!(DateParser.month())
      assert "03" =~ Regex.compile!(DateParser.month())
      assert "04" =~ Regex.compile!(DateParser.month())
      assert "05" =~ Regex.compile!(DateParser.month())
      assert "06" =~ Regex.compile!(DateParser.month())
      assert "07" =~ Regex.compile!(DateParser.month())
      assert "08" =~ Regex.compile!(DateParser.month())
      assert "09" =~ Regex.compile!(DateParser.month())
    end
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

  @tag task_id: 1
  test "numeric pattern for year is a string" do
    assert DateParser.year() |> is_binary()
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

  @tag task_id: 2
  test "pattern for day names is a string" do
    assert DateParser.day_names() |> is_binary()
  end

  @tag task_id: 2
  test "day names match" do
    assert "Sunday" =~ Regex.compile!(DateParser.day_names())
    assert "Monday" =~ Regex.compile!(DateParser.day_names())
    assert "Tuesday" =~ Regex.compile!(DateParser.day_names())
    assert "Wednesday" =~ Regex.compile!(DateParser.day_names())
    assert "Thursday" =~ Regex.compile!(DateParser.day_names())
    assert "Friday" =~ Regex.compile!(DateParser.day_names())
    assert "Saturday" =~ Regex.compile!(DateParser.day_names())
  end

  @tag task_id: 2
  test "day names don't match with trailing or leading whitespace" do
    refute " Sunday " =~ Regex.compile!("^#{DateParser.day_names()}$")
    refute " Monday " =~ Regex.compile!("^#{DateParser.day_names()}$")
    refute " Tuesday " =~ Regex.compile!("^#{DateParser.day_names()}$")
    refute " Wednesday " =~ Regex.compile!("^#{DateParser.day_names()}$")
    refute " Thursday " =~ Regex.compile!("^#{DateParser.day_names()}$")
    refute " Friday " =~ Regex.compile!("^#{DateParser.day_names()}$")
    refute " Saturday " =~ Regex.compile!("^#{DateParser.day_names()}$")
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

  @tag task_id: 2
  test "pattern for month names is a string" do
    assert DateParser.month_names() |> is_binary()
  end

  @tag task_id: 2
  test "month names match" do
    assert "January" =~ Regex.compile!(DateParser.month_names())
    assert "February" =~ Regex.compile!(DateParser.month_names())
    assert "March" =~ Regex.compile!(DateParser.month_names())
    assert "April" =~ Regex.compile!(DateParser.month_names())
    assert "May" =~ Regex.compile!(DateParser.month_names())
    assert "June" =~ Regex.compile!(DateParser.month_names())
    assert "July" =~ Regex.compile!(DateParser.month_names())
    assert "August" =~ Regex.compile!(DateParser.month_names())
    assert "September" =~ Regex.compile!(DateParser.month_names())
    assert "October" =~ Regex.compile!(DateParser.month_names())
    assert "November" =~ Regex.compile!(DateParser.month_names())
    assert "December" =~ Regex.compile!(DateParser.month_names())
  end

  @tag task_id: 2
  test "month names don't match with trailing or leading whitespace" do
    refute " January " =~ Regex.compile!("^#{DateParser.month_names()}$")
    refute " February " =~ Regex.compile!("^#{DateParser.month_names()}$")
    refute " March " =~ Regex.compile!("^#{DateParser.month_names()}$")
    refute " April " =~ Regex.compile!("^#{DateParser.month_names()}$")
    refute " May " =~ Regex.compile!("^#{DateParser.month_names()}$")
    refute " June " =~ Regex.compile!("^#{DateParser.month_names()}$")
    refute " July " =~ Regex.compile!("^#{DateParser.month_names()}$")
    refute " August " =~ Regex.compile!("^#{DateParser.month_names()}$")
    refute " September " =~ Regex.compile!("^#{DateParser.month_names()}$")
    refute " October " =~ Regex.compile!("^#{DateParser.month_names()}$")
    refute " November " =~ Regex.compile!("^#{DateParser.month_names()}$")
    refute " December " =~ Regex.compile!("^#{DateParser.month_names()}$")
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
      assert DateParser.capture_month() |> is_binary()

      assert %{"month" => "01"} =
               DateParser.capture_month()
               |> Regex.compile!()
               |> Regex.named_captures("01")
    end

    @tag task_id: 3
    test "numeric day" do
      assert DateParser.capture_day() |> is_binary()

      assert %{"day" => "01"} =
               DateParser.capture_day()
               |> Regex.compile!()
               |> Regex.named_captures("01")
    end

    @tag task_id: 3
    test "numeric year" do
      assert DateParser.capture_year() |> is_binary()

      assert %{"year" => "1970"} =
               DateParser.capture_year()
               |> Regex.compile!()
               |> Regex.named_captures("1970")
    end

    @tag task_id: 3
    test "capture day name" do
      assert DateParser.capture_day_name() |> is_binary()

      assert %{"day_name" => "Monday"} =
               DateParser.capture_day_name()
               |> Regex.compile!()
               |> Regex.named_captures("Monday")
    end

    @tag task_id: 3
    test "capture month name" do
      assert DateParser.capture_month_name() |> is_binary()

      assert %{"month_name" => "February"} =
               DateParser.capture_month_name()
               |> Regex.compile!()
               |> Regex.named_captures("February")
    end

    @tag task_id: 4
    test "numeric date" do
      assert DateParser.capture_numeric_date() |> is_binary()

      assert %{"year" => "1970", "month" => "02", "day" => "01"} =
               DateParser.capture_numeric_date()
               |> Regex.compile!()
               |> Regex.named_captures("01/02/1970")
    end

    @tag task_id: 4
    test "month named date" do
      assert DateParser.capture_month_name_date() |> is_binary()

      assert %{"year" => "1970", "month_name" => "January", "day" => "1"} =
               DateParser.capture_month_name_date()
               |> Regex.compile!()
               |> Regex.named_captures("January 1, 1970")
    end

    @tag task_id: 4
    test "day and month named date" do
      assert DateParser.capture_day_month_name_date() |> is_binary()

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
    test "pattern to match numeric date is a regex" do
      assert match?(%Regex{}, DateParser.match_numeric_date())
    end

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
    test "pattern to match month name date is a regex" do
      assert match?(%Regex{}, DateParser.match_month_name_date())
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
    test "pattern to match day month name date is a regex" do
      assert match?(%Regex{}, DateParser.match_day_month_name_date())
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
