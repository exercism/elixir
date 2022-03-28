defmodule LibraryFeesTest do
  use ExUnit.Case

  describe "datetime_from_string/1" do
    @tag task_id: 1
    test "returns NaiveDateTime" do
      result = LibraryFees.datetime_from_string("2021-01-01T12:00:00Z")
      assert result.__struct__ == NaiveDateTime
    end

    @tag task_id: 1
    test "parses an ISO8601 string" do
      result = LibraryFees.datetime_from_string("2019-12-24T13:15:45Z")
      assert result == ~N[2019-12-24 13:15:45Z]
    end
  end

  describe "before_noon?/1" do
    @tag task_id: 2
    test "returns true if the given NaiveDateTime is before 12:00" do
      assert LibraryFees.before_noon?(~N[2020-06-06 11:59:59Z]) == true
    end

    @tag task_id: 2
    test "returns false if the given NaiveDateTime is after 12:00" do
      assert LibraryFees.before_noon?(~N[2021-01-03 12:01:01Z]) == false
    end

    @tag task_id: 2
    test "returns false if the given NaiveDateTime is exactly at 12:00" do
      assert LibraryFees.before_noon?(~N[2018-11-17 12:00:00Z]) == false
    end
  end

  describe "return_date/1" do
    @tag task_id: 3
    test "adds 28 days if the given NaiveDateTime is before 12:00" do
      result = LibraryFees.return_date(~N[2020-02-14 11:59:59Z])
      assert result == ~D[2020-03-13]
    end

    @tag task_id: 3
    test "adds 29 days if the given NaiveDateTime is after 12:00" do
      result = LibraryFees.return_date(~N[2021-01-03 12:01:01Z])
      assert result == ~D[2021-02-01]
    end

    @tag task_id: 3
    test "adds 29 days if the given NaiveDateTime is exactly at 12:00" do
      result = LibraryFees.return_date(~N[2018-12-01 12:00:00Z])
      assert result == ~D[2018-12-30]
    end
  end

  describe "days_late/2" do
    @tag task_id: 4
    test "returns 0 when identical datetimes" do
      result = LibraryFees.days_late(~D[2021-02-01], ~N[2021-02-01 12:00:00Z])
      assert result == 0
    end

    @tag task_id: 4
    test "returns 0 when identical dates, but different times" do
      result = LibraryFees.days_late(~D[2019-03-11], ~N[2019-03-11 12:00:00Z])
      assert result == 0
    end

    @tag task_id: 4
    test "returns 0 when planned return date is later than actual return date" do
      result = LibraryFees.days_late(~D[2020-12-03], ~N[2020-11-29 16:00:00Z])
      assert result == 0
    end

    @tag task_id: 4
    test "returns date difference in numbers of days when planned return date is earlier than actual return date" do
      result = LibraryFees.days_late(~D[2020-06-12], ~N[2020-06-21 16:00:00Z])
      assert result == 9
    end

    @tag task_id: 4
    test "a new day starts at midnight" do
      result = LibraryFees.days_late(~D[2020-06-12], ~N[2020-06-12 23:59:59Z])
      assert result == 0

      result = LibraryFees.days_late(~D[2020-06-12], ~N[2020-06-13 00:00:00Z])
      assert result == 1
    end
  end

  describe "monday?" do
    @tag task_id: 5
    test "2021-02-01 was a Monday" do
      assert LibraryFees.monday?(~N[2021-02-01 14:01:00Z]) == true
    end

    @tag task_id: 5
    test "2020-03-16 was a Monday" do
      assert LibraryFees.monday?(~N[2020-03-16 09:23:52Z]) == true
    end

    @tag task_id: 5
    test "2020-04-22 was a Monday" do
      assert LibraryFees.monday?(~N[2019-04-22 15:44:03Z]) == true
    end

    @tag task_id: 5
    test "2021-02-02 was a Tuesday" do
      assert LibraryFees.monday?(~N[2021-02-02 15:07:00Z]) == false
    end

    @tag task_id: 5
    test "2020-03-14 was a Friday" do
      assert LibraryFees.monday?(~N[2020-03-14 08:54:51Z]) == false
    end

    @tag task_id: 5
    test "2019-04-28 was a Sunday" do
      assert LibraryFees.monday?(~N[2019-04-28 11:37:12Z]) == false
    end
  end

  describe "calculate_late_fee/2" do
    @tag task_id: 6
    test "returns 0 if the book was returned less than 28 days after a morning checkout" do
      result = LibraryFees.calculate_late_fee("2018-11-01T09:00:00Z", "2018-11-13T14:12:00Z", 123)
      assert result == 0
    end

    @tag task_id: 6
    test "returns 0 if the book was returned exactly 28 days after a morning checkout" do
      result = LibraryFees.calculate_late_fee("2018-11-01T09:00:00Z", "2018-11-29T14:12:00Z", 123)
      assert result == 0
    end

    @tag task_id: 6
    test "returns the rate for one day if the book was returned exactly 29 days after a morning checkout" do
      result = LibraryFees.calculate_late_fee("2018-11-01T09:00:00Z", "2018-11-30T14:12:00Z", 320)
      assert result == 320
    end

    @tag task_id: 6
    test "returns 0 if the book was returned less than 29 days after an afternoon checkout" do
      result = LibraryFees.calculate_late_fee("2019-05-01T16:12:00Z", "2019-05-17T14:32:45Z", 400)
      assert result == 0
    end

    @tag task_id: 6
    test "returns 0 if the book was returned exactly 29 days after an afternoon checkout" do
      result = LibraryFees.calculate_late_fee("2019-05-01T16:12:00Z", "2019-05-30T14:32:45Z", 313)
      assert result == 0
    end

    @tag task_id: 6
    test "returns the rate for one day if the book was returned exactly 30 days after an afternoon checkout" do
      result = LibraryFees.calculate_late_fee("2019-05-01T16:12:00Z", "2019-05-31T14:32:45Z", 234)
      assert result == 234
    end

    @tag task_id: 6
    test "multiplies the number of days late by the rate for one day" do
      result = LibraryFees.calculate_late_fee("2021-01-01T08:00:00Z", "2021-02-13T08:00:00Z", 111)
      assert result == 111 * 15
    end

    @tag task_id: 6
    test "late fees are 50% off (rounded down) when the book is returned on a Monday" do
      result = LibraryFees.calculate_late_fee("2021-01-01T08:00:00Z", "2021-02-15T08:00:00Z", 111)
      assert result == trunc(111 * 17 * 0.5)
    end
  end
end
