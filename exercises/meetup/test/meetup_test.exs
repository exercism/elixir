defmodule MeetupTest do
  use ExUnit.Case

  # @tag :pending
  test "monteenth of may 2013" do
    assert Meetup.meetup(2013, 5, :monday, :teenth) == ~D[2013-05-13]
  end

  @tag :pending
  test "monteenth of august 2013" do
    assert Meetup.meetup(2013, 8, :monday, :teenth) == ~D[2013-08-19]
  end

  @tag :pending
  test "monteenth of september 2013" do
    assert Meetup.meetup(2013, 9, :monday, :teenth) == ~D[2013-09-16]
  end

  @tag :pending
  test "tuesteenth of march 2013" do
    assert Meetup.meetup(2013, 3, :tuesday, :teenth) == ~D[2013-03-19]
  end

  @tag :pending
  test "tuesteenth of april 2013" do
    assert Meetup.meetup(2013, 4, :tuesday, :teenth) == ~D[2013-04-16]
  end

  @tag :pending
  test "tuesteenth of august 2013" do
    assert Meetup.meetup(2013, 8, :tuesday, :teenth) == ~D[2013-08-13]
  end

  @tag :pending
  test "wednesteenth of january 2013" do
    assert Meetup.meetup(2013, 1, :wednesday, :teenth) == ~D[2013-01-16]
  end

  @tag :pending
  test "wednesteenth of february 2013" do
    assert Meetup.meetup(2013, 2, :wednesday, :teenth) == ~D[2013-02-13]
  end

  @tag :pending
  test "wednesteenth of june 2013" do
    assert Meetup.meetup(2013, 6, :wednesday, :teenth) == ~D[2013-06-19]
  end

  @tag :pending
  test "thursteenth of may 2013" do
    assert Meetup.meetup(2013, 5, :thursday, :teenth) == ~D[2013-05-16]
  end

  @tag :pending
  test "thursteenth of june 2013" do
    assert Meetup.meetup(2013, 6, :thursday, :teenth) == ~D[2013-06-13]
  end

  @tag :pending
  test "thursteenth of september 2013" do
    assert Meetup.meetup(2013, 9, :thursday, :teenth) == ~D[2013-09-19]
  end

  @tag :pending
  test "friteenth of april 2013" do
    assert Meetup.meetup(2013, 4, :friday, :teenth) == ~D[2013-04-19]
  end

  @tag :pending
  test "friteenth of august 2013" do
    assert Meetup.meetup(2013, 8, :friday, :teenth) == ~D[2013-08-16]
  end

  @tag :pending
  test "friteenth of september 2013" do
    assert Meetup.meetup(2013, 9, :friday, :teenth) == ~D[2013-09-13]
  end

  @tag :pending
  test "saturteenth of february 2013" do
    assert Meetup.meetup(2013, 2, :saturday, :teenth) == ~D[2013-02-16]
  end

  @tag :pending
  test "saturteenth of april 2013" do
    assert Meetup.meetup(2013, 4, :saturday, :teenth) == ~D[2013-04-13]
  end

  @tag :pending
  test "saturteenth of october 2013" do
    assert Meetup.meetup(2013, 10, :saturday, :teenth) == ~D[2013-10-19]
  end

  @tag :pending
  test "sunteenth of may 2013" do
    assert Meetup.meetup(2013, 5, :sunday, :teenth) == ~D[2013-05-19]
  end

  @tag :pending
  test "sunteenth of june 2013" do
    assert Meetup.meetup(2013, 6, :sunday, :teenth) == ~D[2013-06-16]
  end

  @tag :pending
  test "sunteenth of october 2013" do
    assert Meetup.meetup(2013, 10, :sunday, :teenth) == ~D[2013-10-13]
  end

  @tag :pending
  test "first monday of march 2013" do
    assert Meetup.meetup(2013, 3, :monday, :first) == ~D[2013-03-04]
  end

  @tag :pending
  test "first monday of april 2013" do
    assert Meetup.meetup(2013, 4, :monday, :first) == ~D[2013-04-01]
  end

  @tag :pending
  test "first tuesday of may 2013" do
    assert Meetup.meetup(2013, 5, :tuesday, :first) == ~D[2013-05-07]
  end

  @tag :pending
  test "first tuesday of june 2013" do
    assert Meetup.meetup(2013, 6, :tuesday, :first) == ~D[2013-06-04]
  end

  @tag :pending
  test "first wednesday of july 2013" do
    assert Meetup.meetup(2013, 7, :wednesday, :first) == ~D[2013-07-03]
  end

  @tag :pending
  test "first wednesday of august 2013" do
    assert Meetup.meetup(2013, 8, :wednesday, :first) == ~D[2013-08-07]
  end

  @tag :pending
  test "first thursday of september 2013" do
    assert Meetup.meetup(2013, 9, :thursday, :first) == ~D[2013-09-05]
  end

  @tag :pending
  test "first thursday of october 2013" do
    assert Meetup.meetup(2013, 10, :thursday, :first) == ~D[2013-10-03]
  end

  @tag :pending
  test "first friday of november 2013" do
    assert Meetup.meetup(2013, 11, :friday, :first) == ~D[2013-11-01]
  end

  @tag :pending
  test "first friday of december 2013" do
    assert Meetup.meetup(2013, 12, :friday, :first) == ~D[2013-12-06]
  end

  @tag :pending
  test "first saturday of january 2013" do
    assert Meetup.meetup(2013, 1, :saturday, :first) == ~D[2013-01-05]
  end

  @tag :pending
  test "first saturday of february 2013" do
    assert Meetup.meetup(2013, 2, :saturday, :first) == ~D[2013-02-02]
  end

  @tag :pending
  test "first sunday of march 2013" do
    assert Meetup.meetup(2013, 3, :sunday, :first) == ~D[2013-03-03]
  end

  @tag :pending
  test "first sunday of april 2013" do
    assert Meetup.meetup(2013, 4, :sunday, :first) == ~D[2013-04-07]
  end

  @tag :pending
  test "second monday of march 2013" do
    assert Meetup.meetup(2013, 3, :monday, :second) == ~D[2013-03-11]
  end

  @tag :pending
  test "second monday of april 2013" do
    assert Meetup.meetup(2013, 4, :monday, :second) == ~D[2013-04-08]
  end

  @tag :pending
  test "second tuesday of may 2013" do
    assert Meetup.meetup(2013, 5, :tuesday, :second) == ~D[2013-05-14]
  end

  @tag :pending
  test "second tuesday of june 2013" do
    assert Meetup.meetup(2013, 6, :tuesday, :second) == ~D[2013-06-11]
  end

  @tag :pending
  test "second wednesday of july 2013" do
    assert Meetup.meetup(2013, 7, :wednesday, :second) == ~D[2013-07-10]
  end

  @tag :pending
  test "second wednesday of august 2013" do
    assert Meetup.meetup(2013, 8, :wednesday, :second) == ~D[2013-08-14]
  end

  @tag :pending
  test "second thursday of september 2013" do
    assert Meetup.meetup(2013, 9, :thursday, :second) == ~D[2013-09-12]
  end

  @tag :pending
  test "second thursday of october 2013" do
    assert Meetup.meetup(2013, 10, :thursday, :second) == ~D[2013-10-10]
  end

  @tag :pending
  test "second friday of november 2013" do
    assert Meetup.meetup(2013, 11, :friday, :second) == ~D[2013-11-08]
  end

  @tag :pending
  test "second friday of december 2013" do
    assert Meetup.meetup(2013, 12, :friday, :second) == ~D[2013-12-13]
  end

  @tag :pending
  test "second saturday of january 2013" do
    assert Meetup.meetup(2013, 1, :saturday, :second) == ~D[2013-01-12]
  end

  @tag :pending
  test "second saturday of february 2013" do
    assert Meetup.meetup(2013, 2, :saturday, :second) == ~D[2013-02-09]
  end

  @tag :pending
  test "second sunday of march 2013" do
    assert Meetup.meetup(2013, 3, :sunday, :second) == ~D[2013-03-10]
  end

  @tag :pending
  test "second sunday of april 2013" do
    assert Meetup.meetup(2013, 4, :sunday, :second) == ~D[2013-04-14]
  end

  @tag :pending
  test "third monday of march 2013" do
    assert Meetup.meetup(2013, 3, :monday, :third) == ~D[2013-03-18]
  end

  @tag :pending
  test "third monday of april 2013" do
    assert Meetup.meetup(2013, 4, :monday, :third) == ~D[2013-04-15]
  end

  @tag :pending
  test "third tuesday of may 2013" do
    assert Meetup.meetup(2013, 5, :tuesday, :third) == ~D[2013-05-21]
  end

  @tag :pending
  test "third tuesday of june 2013" do
    assert Meetup.meetup(2013, 6, :tuesday, :third) == ~D[2013-06-18]
  end

  @tag :pending
  test "third wednesday of july 2013" do
    assert Meetup.meetup(2013, 7, :wednesday, :third) == ~D[2013-07-17]
  end

  @tag :pending
  test "third wednesday of august 2013" do
    assert Meetup.meetup(2013, 8, :wednesday, :third) == ~D[2013-08-21]
  end

  @tag :pending
  test "third thursday of september 2013" do
    assert Meetup.meetup(2013, 9, :thursday, :third) == ~D[2013-09-19]
  end

  @tag :pending
  test "third thursday of october 2013" do
    assert Meetup.meetup(2013, 10, :thursday, :third) == ~D[2013-10-17]
  end

  @tag :pending
  test "third friday of november 2013" do
    assert Meetup.meetup(2013, 11, :friday, :third) == ~D[2013-11-15]
  end

  @tag :pending
  test "third friday of december 2013" do
    assert Meetup.meetup(2013, 12, :friday, :third) == ~D[2013-12-20]
  end

  @tag :pending
  test "third saturday of january 2013" do
    assert Meetup.meetup(2013, 1, :saturday, :third) == ~D[2013-01-19]
  end

  @tag :pending
  test "third saturday of february 2013" do
    assert Meetup.meetup(2013, 2, :saturday, :third) == ~D[2013-02-16]
  end

  @tag :pending
  test "third sunday of march 2013" do
    assert Meetup.meetup(2013, 3, :sunday, :third) == ~D[2013-03-17]
  end

  @tag :pending
  test "third sunday of april 2013" do
    assert Meetup.meetup(2013, 4, :sunday, :third) == ~D[2013-04-21]
  end

  @tag :pending
  test "fourth monday of march 2013" do
    assert Meetup.meetup(2013, 3, :monday, :fourth) == ~D[2013-03-25]
  end

  @tag :pending
  test "fourth monday of april 2013" do
    assert Meetup.meetup(2013, 4, :monday, :fourth) == ~D[2013-04-22]
  end

  @tag :pending
  test "fourth tuesday of may 2013" do
    assert Meetup.meetup(2013, 5, :tuesday, :fourth) == ~D[2013-05-28]
  end

  @tag :pending
  test "fourth tuesday of june 2013" do
    assert Meetup.meetup(2013, 6, :tuesday, :fourth) == ~D[2013-06-25]
  end

  @tag :pending
  test "fourth wednesday of july 2013" do
    assert Meetup.meetup(2013, 7, :wednesday, :fourth) == ~D[2013-07-24]
  end

  @tag :pending
  test "fourth wednesday of august 2013" do
    assert Meetup.meetup(2013, 8, :wednesday, :fourth) == ~D[2013-08-28]
  end

  @tag :pending
  test "fourth thursday of september 2013" do
    assert Meetup.meetup(2013, 9, :thursday, :fourth) == ~D[2013-09-26]
  end

  @tag :pending
  test "fourth thursday of october 2013" do
    assert Meetup.meetup(2013, 10, :thursday, :fourth) == ~D[2013-10-24]
  end

  @tag :pending
  test "fourth friday of november 2013" do
    assert Meetup.meetup(2013, 11, :friday, :fourth) == ~D[2013-11-22]
  end

  @tag :pending
  test "fourth friday of december 2013" do
    assert Meetup.meetup(2013, 12, :friday, :fourth) == ~D[2013-12-27]
  end

  @tag :pending
  test "fourth saturday of january 2013" do
    assert Meetup.meetup(2013, 1, :saturday, :fourth) == ~D[2013-01-26]
  end

  @tag :pending
  test "fourth saturday of february 2013" do
    assert Meetup.meetup(2013, 2, :saturday, :fourth) == ~D[2013-02-23]
  end

  @tag :pending
  test "fourth sunday of march 2013" do
    assert Meetup.meetup(2013, 3, :sunday, :fourth) == ~D[2013-03-24]
  end

  @tag :pending
  test "fourth sunday of april 2013" do
    assert Meetup.meetup(2013, 4, :sunday, :fourth) == ~D[2013-04-28]
  end

  @tag :pending
  test "last monday of march 2013" do
    assert Meetup.meetup(2013, 3, :monday, :last) == ~D[2013-03-25]
  end

  @tag :pending
  test "last monday of april 2013" do
    assert Meetup.meetup(2013, 4, :monday, :last) == ~D[2013-04-29]
  end

  @tag :pending
  test "last tuesday of may 2013" do
    assert Meetup.meetup(2013, 5, :tuesday, :last) == ~D[2013-05-28]
  end

  @tag :pending
  test "last tuesday of june 2013" do
    assert Meetup.meetup(2013, 6, :tuesday, :last) == ~D[2013-06-25]
  end

  @tag :pending
  test "last wednesday of july 2013" do
    assert Meetup.meetup(2013, 7, :wednesday, :last) == ~D[2013-07-31]
  end

  @tag :pending
  test "last wednesday of august 2013" do
    assert Meetup.meetup(2013, 8, :wednesday, :last) == ~D[2013-08-28]
  end

  @tag :pending
  test "last thursday of september 2013" do
    assert Meetup.meetup(2013, 9, :thursday, :last) == ~D[2013-09-26]
  end

  @tag :pending
  test "last thursday of october 2013" do
    assert Meetup.meetup(2013, 10, :thursday, :last) == ~D[2013-10-31]
  end

  @tag :pending
  test "last friday of november 2013" do
    assert Meetup.meetup(2013, 11, :friday, :last) == ~D[2013-11-29]
  end

  @tag :pending
  test "last friday of december 2013" do
    assert Meetup.meetup(2013, 12, :friday, :last) == ~D[2013-12-27]
  end

  @tag :pending
  test "last saturday of january 2013" do
    assert Meetup.meetup(2013, 1, :saturday, :last) == ~D[2013-01-26]
  end

  @tag :pending
  test "last saturday of february 2013" do
    assert Meetup.meetup(2013, 2, :saturday, :last) == ~D[2013-02-23]
  end

  @tag :pending
  test "last sunday of march 2013" do
    assert Meetup.meetup(2013, 3, :sunday, :last) == ~D[2013-03-31]
  end

  @tag :pending
  test "last sunday of april 2013" do
    assert Meetup.meetup(2013, 4, :sunday, :last) == ~D[2013-04-28]
  end
end
