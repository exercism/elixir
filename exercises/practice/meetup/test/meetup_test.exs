defmodule MeetupTest do
  use ExUnit.Case

  # @tag :pending
  test "monteenth of May 2013" do
    date = Meetup.meetup(2013, 5, :monday, :teenth)
    assert_dates_equal(date, ~D[2013-05-13])
  end

  @tag :pending
  test "monteenth of August 2013" do
    date = Meetup.meetup(2013, 8, :monday, :teenth)
    assert_dates_equal(date, ~D[2013-08-19])
  end

  @tag :pending
  test "monteenth of September 2013" do
    date = Meetup.meetup(2013, 9, :monday, :teenth)
    assert_dates_equal(date, ~D[2013-09-16])
  end

  @tag :pending
  test "tuesteenth of March 2013" do
    date = Meetup.meetup(2013, 3, :tuesday, :teenth)
    assert_dates_equal(date, ~D[2013-03-19])
  end

  @tag :pending
  test "tuesteenth of April 2013" do
    date = Meetup.meetup(2013, 4, :tuesday, :teenth)
    assert_dates_equal(date, ~D[2013-04-16])
  end

  @tag :pending
  test "tuesteenth of August 2013" do
    date = Meetup.meetup(2013, 8, :tuesday, :teenth)
    assert_dates_equal(date, ~D[2013-08-13])
  end

  @tag :pending
  test "wednesteenth of January 2013" do
    date = Meetup.meetup(2013, 1, :wednesday, :teenth)
    assert_dates_equal(date, ~D[2013-01-16])
  end

  @tag :pending
  test "wednesteenth of February 2013" do
    date = Meetup.meetup(2013, 2, :wednesday, :teenth)
    assert_dates_equal(date, ~D[2013-02-13])
  end

  @tag :pending
  test "wednesteenth of June 2013" do
    date = Meetup.meetup(2013, 6, :wednesday, :teenth)
    assert_dates_equal(date, ~D[2013-06-19])
  end

  @tag :pending
  test "thursteenth of May 2013" do
    date = Meetup.meetup(2013, 5, :thursday, :teenth)
    assert_dates_equal(date, ~D[2013-05-16])
  end

  @tag :pending
  test "thursteenth of June 2013" do
    date = Meetup.meetup(2013, 6, :thursday, :teenth)
    assert_dates_equal(date, ~D[2013-06-13])
  end

  @tag :pending
  test "thursteenth of September 2013" do
    date = Meetup.meetup(2013, 9, :thursday, :teenth)
    assert_dates_equal(date, ~D[2013-09-19])
  end

  @tag :pending
  test "friteenth of April 2013" do
    date = Meetup.meetup(2013, 4, :friday, :teenth)
    assert_dates_equal(date, ~D[2013-04-19])
  end

  @tag :pending
  test "friteenth of August 2013" do
    date = Meetup.meetup(2013, 8, :friday, :teenth)
    assert_dates_equal(date, ~D[2013-08-16])
  end

  @tag :pending
  test "friteenth of September 2013" do
    date = Meetup.meetup(2013, 9, :friday, :teenth)
    assert_dates_equal(date, ~D[2013-09-13])
  end

  @tag :pending
  test "saturteenth of February 2013" do
    date = Meetup.meetup(2013, 2, :saturday, :teenth)
    assert_dates_equal(date, ~D[2013-02-16])
  end

  @tag :pending
  test "saturteenth of April 2013" do
    date = Meetup.meetup(2013, 4, :saturday, :teenth)
    assert_dates_equal(date, ~D[2013-04-13])
  end

  @tag :pending
  test "saturteenth of October 2013" do
    date = Meetup.meetup(2013, 10, :saturday, :teenth)
    assert_dates_equal(date, ~D[2013-10-19])
  end

  @tag :pending
  test "sunteenth of May 2013" do
    date = Meetup.meetup(2013, 5, :sunday, :teenth)
    assert_dates_equal(date, ~D[2013-05-19])
  end

  @tag :pending
  test "sunteenth of June 2013" do
    date = Meetup.meetup(2013, 6, :sunday, :teenth)
    assert_dates_equal(date, ~D[2013-06-16])
  end

  @tag :pending
  test "sunteenth of October 2013" do
    date = Meetup.meetup(2013, 10, :sunday, :teenth)
    assert_dates_equal(date, ~D[2013-10-13])
  end

  @tag :pending
  test "first Monday of March 2013" do
    date = Meetup.meetup(2013, 3, :monday, :first)
    assert_dates_equal(date, ~D[2013-03-04])
  end

  @tag :pending
  test "first Monday of April 2013" do
    date = Meetup.meetup(2013, 4, :monday, :first)
    assert_dates_equal(date, ~D[2013-04-01])
  end

  @tag :pending
  test "first Tuesday of May 2013" do
    date = Meetup.meetup(2013, 5, :tuesday, :first)
    assert_dates_equal(date, ~D[2013-05-07])
  end

  @tag :pending
  test "first Tuesday of June 2013" do
    date = Meetup.meetup(2013, 6, :tuesday, :first)
    assert_dates_equal(date, ~D[2013-06-04])
  end

  @tag :pending
  test "first Wednesday of July 2013" do
    date = Meetup.meetup(2013, 7, :wednesday, :first)
    assert_dates_equal(date, ~D[2013-07-03])
  end

  @tag :pending
  test "first Wednesday of August 2013" do
    date = Meetup.meetup(2013, 8, :wednesday, :first)
    assert_dates_equal(date, ~D[2013-08-07])
  end

  @tag :pending
  test "first Thursday of September 2013" do
    date = Meetup.meetup(2013, 9, :thursday, :first)
    assert_dates_equal(date, ~D[2013-09-05])
  end

  @tag :pending
  test "first Thursday of October 2013" do
    date = Meetup.meetup(2013, 10, :thursday, :first)
    assert_dates_equal(date, ~D[2013-10-03])
  end

  @tag :pending
  test "first Friday of November 2013" do
    date = Meetup.meetup(2013, 11, :friday, :first)
    assert_dates_equal(date, ~D[2013-11-01])
  end

  @tag :pending
  test "first Friday of December 2013" do
    date = Meetup.meetup(2013, 12, :friday, :first)
    assert_dates_equal(date, ~D[2013-12-06])
  end

  @tag :pending
  test "first Saturday of January 2013" do
    date = Meetup.meetup(2013, 1, :saturday, :first)
    assert_dates_equal(date, ~D[2013-01-05])
  end

  @tag :pending
  test "first Saturday of February 2013" do
    date = Meetup.meetup(2013, 2, :saturday, :first)
    assert_dates_equal(date, ~D[2013-02-02])
  end

  @tag :pending
  test "first Sunday of March 2013" do
    date = Meetup.meetup(2013, 3, :sunday, :first)
    assert_dates_equal(date, ~D[2013-03-03])
  end

  @tag :pending
  test "first Sunday of April 2013" do
    date = Meetup.meetup(2013, 4, :sunday, :first)
    assert_dates_equal(date, ~D[2013-04-07])
  end

  @tag :pending
  test "second Monday of March 2013" do
    date = Meetup.meetup(2013, 3, :monday, :second)
    assert_dates_equal(date, ~D[2013-03-11])
  end

  @tag :pending
  test "second Monday of April 2013" do
    date = Meetup.meetup(2013, 4, :monday, :second)
    assert_dates_equal(date, ~D[2013-04-08])
  end

  @tag :pending
  test "second Tuesday of May 2013" do
    date = Meetup.meetup(2013, 5, :tuesday, :second)
    assert_dates_equal(date, ~D[2013-05-14])
  end

  @tag :pending
  test "second Tuesday of June 2013" do
    date = Meetup.meetup(2013, 6, :tuesday, :second)
    assert_dates_equal(date, ~D[2013-06-11])
  end

  @tag :pending
  test "second Wednesday of July 2013" do
    date = Meetup.meetup(2013, 7, :wednesday, :second)
    assert_dates_equal(date, ~D[2013-07-10])
  end

  @tag :pending
  test "second Wednesday of August 2013" do
    date = Meetup.meetup(2013, 8, :wednesday, :second)
    assert_dates_equal(date, ~D[2013-08-14])
  end

  @tag :pending
  test "second Thursday of September 2013" do
    date = Meetup.meetup(2013, 9, :thursday, :second)
    assert_dates_equal(date, ~D[2013-09-12])
  end

  @tag :pending
  test "second Thursday of October 2013" do
    date = Meetup.meetup(2013, 10, :thursday, :second)
    assert_dates_equal(date, ~D[2013-10-10])
  end

  @tag :pending
  test "second Friday of November 2013" do
    date = Meetup.meetup(2013, 11, :friday, :second)
    assert_dates_equal(date, ~D[2013-11-08])
  end

  @tag :pending
  test "second Friday of December 2013" do
    date = Meetup.meetup(2013, 12, :friday, :second)
    assert_dates_equal(date, ~D[2013-12-13])
  end

  @tag :pending
  test "second Saturday of January 2013" do
    date = Meetup.meetup(2013, 1, :saturday, :second)
    assert_dates_equal(date, ~D[2013-01-12])
  end

  @tag :pending
  test "second Saturday of February 2013" do
    date = Meetup.meetup(2013, 2, :saturday, :second)
    assert_dates_equal(date, ~D[2013-02-09])
  end

  @tag :pending
  test "second Sunday of March 2013" do
    date = Meetup.meetup(2013, 3, :sunday, :second)
    assert_dates_equal(date, ~D[2013-03-10])
  end

  @tag :pending
  test "second Sunday of April 2013" do
    date = Meetup.meetup(2013, 4, :sunday, :second)
    assert_dates_equal(date, ~D[2013-04-14])
  end

  @tag :pending
  test "third Monday of March 2013" do
    date = Meetup.meetup(2013, 3, :monday, :third)
    assert_dates_equal(date, ~D[2013-03-18])
  end

  @tag :pending
  test "third Monday of April 2013" do
    date = Meetup.meetup(2013, 4, :monday, :third)
    assert_dates_equal(date, ~D[2013-04-15])
  end

  @tag :pending
  test "third Tuesday of May 2013" do
    date = Meetup.meetup(2013, 5, :tuesday, :third)
    assert_dates_equal(date, ~D[2013-05-21])
  end

  @tag :pending
  test "third Tuesday of June 2013" do
    date = Meetup.meetup(2013, 6, :tuesday, :third)
    assert_dates_equal(date, ~D[2013-06-18])
  end

  @tag :pending
  test "third Wednesday of July 2013" do
    date = Meetup.meetup(2013, 7, :wednesday, :third)
    assert_dates_equal(date, ~D[2013-07-17])
  end

  @tag :pending
  test "third Wednesday of August 2013" do
    date = Meetup.meetup(2013, 8, :wednesday, :third)
    assert_dates_equal(date, ~D[2013-08-21])
  end

  @tag :pending
  test "third Thursday of September 2013" do
    date = Meetup.meetup(2013, 9, :thursday, :third)
    assert_dates_equal(date, ~D[2013-09-19])
  end

  @tag :pending
  test "third Thursday of October 2013" do
    date = Meetup.meetup(2013, 10, :thursday, :third)
    assert_dates_equal(date, ~D[2013-10-17])
  end

  @tag :pending
  test "third Friday of November 2013" do
    date = Meetup.meetup(2013, 11, :friday, :third)
    assert_dates_equal(date, ~D[2013-11-15])
  end

  @tag :pending
  test "third Friday of December 2013" do
    date = Meetup.meetup(2013, 12, :friday, :third)
    assert_dates_equal(date, ~D[2013-12-20])
  end

  @tag :pending
  test "third Saturday of January 2013" do
    date = Meetup.meetup(2013, 1, :saturday, :third)
    assert_dates_equal(date, ~D[2013-01-19])
  end

  @tag :pending
  test "third Saturday of February 2013" do
    date = Meetup.meetup(2013, 2, :saturday, :third)
    assert_dates_equal(date, ~D[2013-02-16])
  end

  @tag :pending
  test "third Sunday of March 2013" do
    date = Meetup.meetup(2013, 3, :sunday, :third)
    assert_dates_equal(date, ~D[2013-03-17])
  end

  @tag :pending
  test "third Sunday of April 2013" do
    date = Meetup.meetup(2013, 4, :sunday, :third)
    assert_dates_equal(date, ~D[2013-04-21])
  end

  @tag :pending
  test "fourth Monday of March 2013" do
    date = Meetup.meetup(2013, 3, :monday, :fourth)
    assert_dates_equal(date, ~D[2013-03-25])
  end

  @tag :pending
  test "fourth Monday of April 2013" do
    date = Meetup.meetup(2013, 4, :monday, :fourth)
    assert_dates_equal(date, ~D[2013-04-22])
  end

  @tag :pending
  test "fourth Tuesday of May 2013" do
    date = Meetup.meetup(2013, 5, :tuesday, :fourth)
    assert_dates_equal(date, ~D[2013-05-28])
  end

  @tag :pending
  test "fourth Tuesday of June 2013" do
    date = Meetup.meetup(2013, 6, :tuesday, :fourth)
    assert_dates_equal(date, ~D[2013-06-25])
  end

  @tag :pending
  test "fourth Wednesday of July 2013" do
    date = Meetup.meetup(2013, 7, :wednesday, :fourth)
    assert_dates_equal(date, ~D[2013-07-24])
  end

  @tag :pending
  test "fourth Wednesday of August 2013" do
    date = Meetup.meetup(2013, 8, :wednesday, :fourth)
    assert_dates_equal(date, ~D[2013-08-28])
  end

  @tag :pending
  test "fourth Thursday of September 2013" do
    date = Meetup.meetup(2013, 9, :thursday, :fourth)
    assert_dates_equal(date, ~D[2013-09-26])
  end

  @tag :pending
  test "fourth Thursday of October 2013" do
    date = Meetup.meetup(2013, 10, :thursday, :fourth)
    assert_dates_equal(date, ~D[2013-10-24])
  end

  @tag :pending
  test "fourth Friday of November 2013" do
    date = Meetup.meetup(2013, 11, :friday, :fourth)
    assert_dates_equal(date, ~D[2013-11-22])
  end

  @tag :pending
  test "fourth Friday of December 2013" do
    date = Meetup.meetup(2013, 12, :friday, :fourth)
    assert_dates_equal(date, ~D[2013-12-27])
  end

  @tag :pending
  test "fourth Saturday of January 2013" do
    date = Meetup.meetup(2013, 1, :saturday, :fourth)
    assert_dates_equal(date, ~D[2013-01-26])
  end

  @tag :pending
  test "fourth Saturday of February 2013" do
    date = Meetup.meetup(2013, 2, :saturday, :fourth)
    assert_dates_equal(date, ~D[2013-02-23])
  end

  @tag :pending
  test "fourth Sunday of March 2013" do
    date = Meetup.meetup(2013, 3, :sunday, :fourth)
    assert_dates_equal(date, ~D[2013-03-24])
  end

  @tag :pending
  test "fourth Sunday of April 2013" do
    date = Meetup.meetup(2013, 4, :sunday, :fourth)
    assert_dates_equal(date, ~D[2013-04-28])
  end

  @tag :pending
  test "last Monday of March 2013" do
    date = Meetup.meetup(2013, 3, :monday, :last)
    assert_dates_equal(date, ~D[2013-03-25])
  end

  @tag :pending
  test "last Monday of April 2013" do
    date = Meetup.meetup(2013, 4, :monday, :last)
    assert_dates_equal(date, ~D[2013-04-29])
  end

  @tag :pending
  test "last Tuesday of May 2013" do
    date = Meetup.meetup(2013, 5, :tuesday, :last)
    assert_dates_equal(date, ~D[2013-05-28])
  end

  @tag :pending
  test "last Tuesday of June 2013" do
    date = Meetup.meetup(2013, 6, :tuesday, :last)
    assert_dates_equal(date, ~D[2013-06-25])
  end

  @tag :pending
  test "last Wednesday of July 2013" do
    date = Meetup.meetup(2013, 7, :wednesday, :last)
    assert_dates_equal(date, ~D[2013-07-31])
  end

  @tag :pending
  test "last Wednesday of August 2013" do
    date = Meetup.meetup(2013, 8, :wednesday, :last)
    assert_dates_equal(date, ~D[2013-08-28])
  end

  @tag :pending
  test "last Thursday of September 2013" do
    date = Meetup.meetup(2013, 9, :thursday, :last)
    assert_dates_equal(date, ~D[2013-09-26])
  end

  @tag :pending
  test "last Thursday of October 2013" do
    date = Meetup.meetup(2013, 10, :thursday, :last)
    assert_dates_equal(date, ~D[2013-10-31])
  end

  @tag :pending
  test "last Friday of November 2013" do
    date = Meetup.meetup(2013, 11, :friday, :last)
    assert_dates_equal(date, ~D[2013-11-29])
  end

  @tag :pending
  test "last Friday of December 2013" do
    date = Meetup.meetup(2013, 12, :friday, :last)
    assert_dates_equal(date, ~D[2013-12-27])
  end

  @tag :pending
  test "last Saturday of January 2013" do
    date = Meetup.meetup(2013, 1, :saturday, :last)
    assert_dates_equal(date, ~D[2013-01-26])
  end

  @tag :pending
  test "last Saturday of February 2013" do
    date = Meetup.meetup(2013, 2, :saturday, :last)
    assert_dates_equal(date, ~D[2013-02-23])
  end

  @tag :pending
  test "last Sunday of March 2013" do
    date = Meetup.meetup(2013, 3, :sunday, :last)
    assert_dates_equal(date, ~D[2013-03-31])
  end

  @tag :pending
  test "last Sunday of April 2013" do
    date = Meetup.meetup(2013, 4, :sunday, :last)
    assert_dates_equal(date, ~D[2013-04-28])
  end

  @tag :pending
  test "last Wednesday of February 2012" do
    date = Meetup.meetup(2012, 2, :wednesday, :last)
    assert_dates_equal(date, ~D[2012-02-29])
  end

  @tag :pending
  test "last Wednesday of December 2014" do
    date = Meetup.meetup(2014, 12, :wednesday, :last)
    assert_dates_equal(date, ~D[2014-12-31])
  end

  @tag :pending
  test "last Sunday of February 2015" do
    date = Meetup.meetup(2015, 2, :sunday, :last)
    assert_dates_equal(date, ~D[2015-02-22])
  end

  @tag :pending
  test "first Friday of December 2012" do
    date = Meetup.meetup(2012, 12, :friday, :first)
    assert_dates_equal(date, ~D[2012-12-07])
  end

  defp assert_dates_equal(%Date{} = date1, %Date{} = date2) do
    assert Date.compare(date1, date2) == :eq, "expected #{date1} to be equal to #{date2}"
  end

  defp assert_dates_equal(x, %Date{} = date2) do
    flunk("expected #{inspect(x)} to be a date and equal to #{date2}")
  end
end
