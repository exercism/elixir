defmodule MeetupTest do
  use ExUnit.Case

  # @tag :pending
  test "monteenth of may 2013" do
    date = Meetup.meetup(2013, 5, :monday, :teenth)
    assert Date.compare(date, ~D[2013-05-13]) == :eq
  end

  @tag :pending
  test "monteenth of august 2013" do
    date = Meetup.meetup(2013, 8, :monday, :teenth)
    assert Date.compare(date, ~D[2013-08-19]) == :eq
  end

  @tag :pending
  test "monteenth of september 2013" do
    date = Meetup.meetup(2013, 9, :monday, :teenth)
    assert Date.compare(date, ~D[2013-09-16]) == :eq
  end

  @tag :pending
  test "tuesteenth of march 2013" do
    date = Meetup.meetup(2013, 3, :tuesday, :teenth)
    assert Date.compare(date, ~D[2013-03-19]) == :eq
  end

  @tag :pending
  test "tuesteenth of april 2013" do
    date = Meetup.meetup(2013, 4, :tuesday, :teenth)
    assert Date.compare(date, ~D[2013-04-16]) == :eq
  end

  @tag :pending
  test "tuesteenth of august 2013" do
    date = Meetup.meetup(2013, 8, :tuesday, :teenth)
    assert Date.compare(date, ~D[2013-08-13]) == :eq
  end

  @tag :pending
  test "wednesteenth of january 2013" do
    date = Meetup.meetup(2013, 1, :wednesday, :teenth)
    assert Date.compare(date, ~D[2013-01-16]) == :eq
  end

  @tag :pending
  test "wednesteenth of february 2013" do
    date = Meetup.meetup(2013, 2, :wednesday, :teenth)
    assert Date.compare(date, ~D[2013-02-13]) == :eq
  end

  @tag :pending
  test "wednesteenth of june 2013" do
    date = Meetup.meetup(2013, 6, :wednesday, :teenth)
    assert Date.compare(date, ~D[2013-06-19]) == :eq
  end

  @tag :pending
  test "thursteenth of may 2013" do
    date = Meetup.meetup(2013, 5, :thursday, :teenth)
    assert Date.compare(date, ~D[2013-05-16]) == :eq
  end

  @tag :pending
  test "thursteenth of june 2013" do
    date = Meetup.meetup(2013, 6, :thursday, :teenth)
    assert Date.compare(date, ~D[2013-06-13]) == :eq
  end

  @tag :pending
  test "thursteenth of september 2013" do
    date = Meetup.meetup(2013, 9, :thursday, :teenth)
    assert Date.compare(date, ~D[2013-09-19]) == :eq
  end

  @tag :pending
  test "friteenth of april 2013" do
    date = Meetup.meetup(2013, 4, :friday, :teenth)
    assert Date.compare(date, ~D[2013-04-19]) == :eq
  end

  @tag :pending
  test "friteenth of august 2013" do
    date = Meetup.meetup(2013, 8, :friday, :teenth)
    assert Date.compare(date, ~D[2013-08-16]) == :eq
  end

  @tag :pending
  test "friteenth of september 2013" do
    date = Meetup.meetup(2013, 9, :friday, :teenth)
    assert Date.compare(date, ~D[2013-09-13]) == :eq
  end

  @tag :pending
  test "saturteenth of february 2013" do
    date = Meetup.meetup(2013, 2, :saturday, :teenth)
    assert Date.compare(date, ~D[2013-02-16]) == :eq
  end

  @tag :pending
  test "saturteenth of april 2013" do
    date = Meetup.meetup(2013, 4, :saturday, :teenth)
    assert Date.compare(date, ~D[2013-04-13]) == :eq
  end

  @tag :pending
  test "saturteenth of october 2013" do
    date = Meetup.meetup(2013, 10, :saturday, :teenth)
    assert Date.compare(date, ~D[2013-10-19]) == :eq
  end

  @tag :pending
  test "sunteenth of may 2013" do
    date = Meetup.meetup(2013, 5, :sunday, :teenth)
    assert Date.compare(date, ~D[2013-05-19]) == :eq
  end

  @tag :pending
  test "sunteenth of june 2013" do
    date = Meetup.meetup(2013, 6, :sunday, :teenth)
    assert Date.compare(date, ~D[2013-06-16]) == :eq
  end

  @tag :pending
  test "sunteenth of october 2013" do
    date = Meetup.meetup(2013, 10, :sunday, :teenth)
    assert Date.compare(date, ~D[2013-10-13]) == :eq
  end

  @tag :pending
  test "first monday of march 2013" do
    date = Meetup.meetup(2013, 3, :monday, :first)
    assert Date.compare(date, ~D[2013-03-04]) == :eq
  end

  @tag :pending
  test "first monday of april 2013" do
    date = Meetup.meetup(2013, 4, :monday, :first)
    assert Date.compare(date, ~D[2013-04-01]) == :eq
  end

  @tag :pending
  test "first tuesday of may 2013" do
    date = Meetup.meetup(2013, 5, :tuesday, :first)
    assert Date.compare(date, ~D[2013-05-07]) == :eq
  end

  @tag :pending
  test "first tuesday of june 2013" do
    date = Meetup.meetup(2013, 6, :tuesday, :first)
    assert Date.compare(date, ~D[2013-06-04]) == :eq
  end

  @tag :pending
  test "first wednesday of july 2013" do
    date = Meetup.meetup(2013, 7, :wednesday, :first)
    assert Date.compare(date, ~D[2013-07-03]) == :eq
  end

  @tag :pending
  test "first wednesday of august 2013" do
    date = Meetup.meetup(2013, 8, :wednesday, :first)
    assert Date.compare(date, ~D[2013-08-07]) == :eq
  end

  @tag :pending
  test "first thursday of september 2013" do
    date = Meetup.meetup(2013, 9, :thursday, :first)
    assert Date.compare(date, ~D[2013-09-05]) == :eq
  end

  @tag :pending
  test "first thursday of october 2013" do
    date = Meetup.meetup(2013, 10, :thursday, :first)
    assert Date.compare(date, ~D[2013-10-03]) == :eq
  end

  @tag :pending
  test "first friday of november 2013" do
    date = Meetup.meetup(2013, 11, :friday, :first)
    assert Date.compare(date, ~D[2013-11-01]) == :eq
  end

  @tag :pending
  test "first friday of december 2013" do
    date = Meetup.meetup(2013, 12, :friday, :first)
    assert Date.compare(date, ~D[2013-12-06]) == :eq
  end

  @tag :pending
  test "first saturday of january 2013" do
    date = Meetup.meetup(2013, 1, :saturday, :first)
    assert Date.compare(date, ~D[2013-01-05]) == :eq
  end

  @tag :pending
  test "first saturday of february 2013" do
    date = Meetup.meetup(2013, 2, :saturday, :first)
    assert Date.compare(date, ~D[2013-02-02]) == :eq
  end

  @tag :pending
  test "first sunday of march 2013" do
    date = Meetup.meetup(2013, 3, :sunday, :first)
    assert Date.compare(date, ~D[2013-03-03]) == :eq
  end

  @tag :pending
  test "first sunday of april 2013" do
    date = Meetup.meetup(2013, 4, :sunday, :first)
    assert Date.compare(date, ~D[2013-04-07]) == :eq
  end

  @tag :pending
  test "second monday of march 2013" do
    date = Meetup.meetup(2013, 3, :monday, :second)
    assert Date.compare(date, ~D[2013-03-11]) == :eq
  end

  @tag :pending
  test "second monday of april 2013" do
    date = Meetup.meetup(2013, 4, :monday, :second)
    assert Date.compare(date, ~D[2013-04-08]) == :eq
  end

  @tag :pending
  test "second tuesday of may 2013" do
    date = Meetup.meetup(2013, 5, :tuesday, :second)
    assert Date.compare(date, ~D[2013-05-14]) == :eq
  end

  @tag :pending
  test "second tuesday of june 2013" do
    date = Meetup.meetup(2013, 6, :tuesday, :second)
    assert Date.compare(date, ~D[2013-06-11]) == :eq
  end

  @tag :pending
  test "second wednesday of july 2013" do
    date = Meetup.meetup(2013, 7, :wednesday, :second)
    assert Date.compare(date, ~D[2013-07-10]) == :eq
  end

  @tag :pending
  test "second wednesday of august 2013" do
    date = Meetup.meetup(2013, 8, :wednesday, :second)
    assert Date.compare(date, ~D[2013-08-14]) == :eq
  end

  @tag :pending
  test "second thursday of september 2013" do
    date = Meetup.meetup(2013, 9, :thursday, :second)
    assert Date.compare(date, ~D[2013-09-12]) == :eq
  end

  @tag :pending
  test "second thursday of october 2013" do
    date = Meetup.meetup(2013, 10, :thursday, :second)
    assert Date.compare(date, ~D[2013-10-10]) == :eq
  end

  @tag :pending
  test "second friday of november 2013" do
    date = Meetup.meetup(2013, 11, :friday, :second)
    assert Date.compare(date, ~D[2013-11-08]) == :eq
  end

  @tag :pending
  test "second friday of december 2013" do
    date = Meetup.meetup(2013, 12, :friday, :second)
    assert Date.compare(date, ~D[2013-12-13]) == :eq
  end

  @tag :pending
  test "second saturday of january 2013" do
    date = Meetup.meetup(2013, 1, :saturday, :second)
    assert Date.compare(date, ~D[2013-01-12]) == :eq
  end

  @tag :pending
  test "second saturday of february 2013" do
    date = Meetup.meetup(2013, 2, :saturday, :second)
    assert Date.compare(date, ~D[2013-02-09]) == :eq
  end

  @tag :pending
  test "second sunday of march 2013" do
    date = Meetup.meetup(2013, 3, :sunday, :second)
    assert Date.compare(date, ~D[2013-03-10]) == :eq
  end

  @tag :pending
  test "second sunday of april 2013" do
    date = Meetup.meetup(2013, 4, :sunday, :second)
    assert Date.compare(date, ~D[2013-04-14]) == :eq
  end

  @tag :pending
  test "third monday of march 2013" do
    date = Meetup.meetup(2013, 3, :monday, :third)
    assert Date.compare(date, ~D[2013-03-18]) == :eq
  end

  @tag :pending
  test "third monday of april 2013" do
    date = Meetup.meetup(2013, 4, :monday, :third)
    assert Date.compare(date, ~D[2013-04-15]) == :eq
  end

  @tag :pending
  test "third tuesday of may 2013" do
    date = Meetup.meetup(2013, 5, :tuesday, :third)
    assert Date.compare(date, ~D[2013-05-21]) == :eq
  end

  @tag :pending
  test "third tuesday of june 2013" do
    date = Meetup.meetup(2013, 6, :tuesday, :third)
    assert Date.compare(date, ~D[2013-06-18]) == :eq
  end

  @tag :pending
  test "third wednesday of july 2013" do
    date = Meetup.meetup(2013, 7, :wednesday, :third)
    assert Date.compare(date, ~D[2013-07-17]) == :eq
  end

  @tag :pending
  test "third wednesday of august 2013" do
    date = Meetup.meetup(2013, 8, :wednesday, :third)
    assert Date.compare(date, ~D[2013-08-21]) == :eq
  end

  @tag :pending
  test "third thursday of september 2013" do
    date = Meetup.meetup(2013, 9, :thursday, :third)
    assert Date.compare(date, ~D[2013-09-19]) == :eq
  end

  @tag :pending
  test "third thursday of october 2013" do
    date = Meetup.meetup(2013, 10, :thursday, :third)
    assert Date.compare(date, ~D[2013-10-17]) == :eq
  end

  @tag :pending
  test "third friday of november 2013" do
    date = Meetup.meetup(2013, 11, :friday, :third)
    assert Date.compare(date, ~D[2013-11-15]) == :eq
  end

  @tag :pending
  test "third friday of december 2013" do
    date = Meetup.meetup(2013, 12, :friday, :third)
    assert Date.compare(date, ~D[2013-12-20]) == :eq
  end

  @tag :pending
  test "third saturday of january 2013" do
    date = Meetup.meetup(2013, 1, :saturday, :third)
    assert Date.compare(date, ~D[2013-01-19]) == :eq
  end

  @tag :pending
  test "third saturday of february 2013" do
    date = Meetup.meetup(2013, 2, :saturday, :third)
    assert Date.compare(date, ~D[2013-02-16]) == :eq
  end

  @tag :pending
  test "third sunday of march 2013" do
    date = Meetup.meetup(2013, 3, :sunday, :third)
    assert Date.compare(date, ~D[2013-03-17]) == :eq
  end

  @tag :pending
  test "third sunday of april 2013" do
    date = Meetup.meetup(2013, 4, :sunday, :third)
    assert Date.compare(date, ~D[2013-04-21]) == :eq
  end

  @tag :pending
  test "fourth monday of march 2013" do
    date = Meetup.meetup(2013, 3, :monday, :fourth)
    assert Date.compare(date, ~D[2013-03-25]) == :eq
  end

  @tag :pending
  test "fourth monday of april 2013" do
    date = Meetup.meetup(2013, 4, :monday, :fourth)
    assert Date.compare(date, ~D[2013-04-22]) == :eq
  end

  @tag :pending
  test "fourth tuesday of may 2013" do
    date = Meetup.meetup(2013, 5, :tuesday, :fourth)
    assert Date.compare(date, ~D[2013-05-28]) == :eq
  end

  @tag :pending
  test "fourth tuesday of june 2013" do
    date = Meetup.meetup(2013, 6, :tuesday, :fourth)
    assert Date.compare(date, ~D[2013-06-25]) == :eq
  end

  @tag :pending
  test "fourth wednesday of july 2013" do
    date = Meetup.meetup(2013, 7, :wednesday, :fourth)
    assert Date.compare(date, ~D[2013-07-24]) == :eq
  end

  @tag :pending
  test "fourth wednesday of august 2013" do
    date = Meetup.meetup(2013, 8, :wednesday, :fourth)
    assert Date.compare(date, ~D[2013-08-28]) == :eq
  end

  @tag :pending
  test "fourth thursday of september 2013" do
    date = Meetup.meetup(2013, 9, :thursday, :fourth)
    assert Date.compare(date, ~D[2013-09-26]) == :eq
  end

  @tag :pending
  test "fourth thursday of october 2013" do
    date = Meetup.meetup(2013, 10, :thursday, :fourth)
    assert Date.compare(date, ~D[2013-10-24]) == :eq
  end

  @tag :pending
  test "fourth friday of november 2013" do
    date = Meetup.meetup(2013, 11, :friday, :fourth)
    assert Date.compare(date, ~D[2013-11-22]) == :eq
  end

  @tag :pending
  test "fourth friday of december 2013" do
    date = Meetup.meetup(2013, 12, :friday, :fourth)
    assert Date.compare(date, ~D[2013-12-27]) == :eq
  end

  @tag :pending
  test "fourth saturday of january 2013" do
    date = Meetup.meetup(2013, 1, :saturday, :fourth)
    assert Date.compare(date, ~D[2013-01-26]) == :eq
  end

  @tag :pending
  test "fourth saturday of february 2013" do
    date = Meetup.meetup(2013, 2, :saturday, :fourth)
    assert Date.compare(date, ~D[2013-02-23]) == :eq
  end

  @tag :pending
  test "fourth sunday of march 2013" do
    date = Meetup.meetup(2013, 3, :sunday, :fourth)
    assert Date.compare(date, ~D[2013-03-24]) == :eq
  end

  @tag :pending
  test "fourth sunday of april 2013" do
    date = Meetup.meetup(2013, 4, :sunday, :fourth)
    assert Date.compare(date, ~D[2013-04-28]) == :eq
  end

  @tag :pending
  test "last monday of march 2013" do
    date = Meetup.meetup(2013, 3, :monday, :last)
    assert Date.compare(date, ~D[2013-03-25]) == :eq
  end

  @tag :pending
  test "last monday of april 2013" do
    date = Meetup.meetup(2013, 4, :monday, :last)
    assert Date.compare(date, ~D[2013-04-29]) == :eq
  end

  @tag :pending
  test "last tuesday of may 2013" do
    date = Meetup.meetup(2013, 5, :tuesday, :last)
    assert Date.compare(date, ~D[2013-05-28]) == :eq
  end

  @tag :pending
  test "last tuesday of june 2013" do
    date = Meetup.meetup(2013, 6, :tuesday, :last)
    assert Date.compare(date, ~D[2013-06-25]) == :eq
  end

  @tag :pending
  test "last wednesday of july 2013" do
    date = Meetup.meetup(2013, 7, :wednesday, :last)
    assert Date.compare(date, ~D[2013-07-31]) == :eq
  end

  @tag :pending
  test "last wednesday of august 2013" do
    date = Meetup.meetup(2013, 8, :wednesday, :last)
    assert Date.compare(date, ~D[2013-08-28]) == :eq
  end

  @tag :pending
  test "last thursday of september 2013" do
    date = Meetup.meetup(2013, 9, :thursday, :last)
    assert Date.compare(date, ~D[2013-09-26]) == :eq
  end

  @tag :pending
  test "last thursday of october 2013" do
    date = Meetup.meetup(2013, 10, :thursday, :last)
    assert Date.compare(date, ~D[2013-10-31]) == :eq
  end

  @tag :pending
  test "last friday of november 2013" do
    date = Meetup.meetup(2013, 11, :friday, :last)
    assert Date.compare(date, ~D[2013-11-29]) == :eq
  end

  @tag :pending
  test "last friday of december 2013" do
    date = Meetup.meetup(2013, 12, :friday, :last)
    assert Date.compare(date, ~D[2013-12-27]) == :eq
  end

  @tag :pending
  test "last saturday of january 2013" do
    date = Meetup.meetup(2013, 1, :saturday, :last)
    assert Date.compare(date, ~D[2013-01-26]) == :eq
  end

  @tag :pending
  test "last saturday of february 2013" do
    date = Meetup.meetup(2013, 2, :saturday, :last)
    assert Date.compare(date, ~D[2013-02-23]) == :eq
  end

  @tag :pending
  test "last sunday of march 2013" do
    date = Meetup.meetup(2013, 3, :sunday, :last)
    assert Date.compare(date, ~D[2013-03-31]) == :eq
  end

  @tag :pending
  test "last sunday of april 2013" do
    date = Meetup.meetup(2013, 4, :sunday, :last)
    assert Date.compare(date, ~D[2013-04-28]) == :eq
  end
end
