if System.get_env("EXERCISM_TEST_EXAMPLES") do
  Code.load_file("example.exs")
else
  Code.load_file("meetup.exs")
end

ExUnit.start

defmodule MeetupTest do
  use ExUnit.Case, async: false

  test "monteenth of may 2013" do
    assert Meetup.meetup(2013, 5, :monday, :teenth) == {2013, 5, 13}
  end

  test "monteenth of august 2013" do
    assert Meetup.meetup(2013, 8, :monday, :teenth) == {2013, 8, 19}
  end

  test "monteenth of september 2013" do
    assert Meetup.meetup(2013, 9, :monday, :teenth) == {2013, 9, 16}
  end

  test "tuesteenth of march 2013" do
    assert Meetup.meetup(2013, 3, :tuesday, :teenth) == {2013, 3, 19}
  end

  test "tuesteenth of april 2013" do
    assert Meetup.meetup(2013, 4, :tuesday, :teenth) == {2013, 4, 16}
  end

  test "tuesteenth of august 2013" do
    assert Meetup.meetup(2013, 8, :tuesday, :teenth) == {2013, 8, 13}
  end

  test "wednesteenth of january 2013" do
    assert Meetup.meetup(2013, 1, :wednesday, :teenth) == {2013, 1, 16}
  end

  test "wednesteenth of february 2013" do
    assert Meetup.meetup(2013, 2, :wednesday, :teenth) == {2013, 2, 13}
  end

  test "wednesteenth of june 2013" do
    assert Meetup.meetup(2013, 6, :wednesday, :teenth) == {2013, 6, 19}
  end

  test "thursteenth of may 2013" do
    assert Meetup.meetup(2013, 5, :thursday, :teenth) == {2013, 5, 16}
  end

  test "thursteenth of june 2013" do
    assert Meetup.meetup(2013, 6, :thursday, :teenth) == {2013, 6, 13}
  end

  test "thursteenth of september 2013" do
    assert Meetup.meetup(2013, 9, :thursday, :teenth) == {2013, 9, 19}
  end

  test "friteenth of april 2013" do
    assert Meetup.meetup(2013, 4, :friday, :teenth) == {2013, 4, 19}
  end

  test "friteenth of august 2013" do
    assert Meetup.meetup(2013, 8, :friday, :teenth) == {2013, 8, 16}
  end

  test "friteenth of september 2013" do
    assert Meetup.meetup(2013, 9, :friday, :teenth) == {2013, 9, 13}
  end

  test "saturteenth of february 2013" do
    assert Meetup.meetup(2013, 2, :saturday, :teenth) == {2013, 2, 16}
  end

  test "saturteenth of april 2013" do
    assert Meetup.meetup(2013, 4, :saturday, :teenth) == {2013, 4, 13}
  end

  test "saturteenth of october 2013" do
    assert Meetup.meetup(2013, 10, :saturday, :teenth) == {2013, 10, 19}
  end

  test "sunteenth of map 2013" do
    assert Meetup.meetup(2013, 5, :sunday, :teenth) == {2013, 5, 19}
  end

  test "sunteenth of june 2013" do
    assert Meetup.meetup(2013, 6, :sunday, :teenth) == {2013, 6, 16}
  end

  test "sunteenth of october 2013" do
    assert Meetup.meetup(2013, 10, :sunday, :teenth) == {2013, 10, 13}
  end

  test "first monday of march 2013" do
    assert Meetup.meetup(2013, 3, :monday, :first) == {2013, 3, 4}
  end

  test "first monday of april 2013" do
    assert Meetup.meetup(2013, 4, :monday, :first) == {2013, 4, 1}
  end

  test "first tuesday of may 2013" do
    assert Meetup.meetup(2013, 5, :tuesday, :first) == {2013, 5, 7}
  end

  test "first tuesday of june 2013" do
    assert Meetup.meetup(2013, 6, :tuesday, :first) == {2013, 6, 4}
  end

  test "first wednesday of july 2013" do
    assert Meetup.meetup(2013, 7, :wednesday, :first) == {2013, 7, 3}
  end

  test "first wednesday of august 2013" do
    assert Meetup.meetup(2013, 8, :wednesday, :first) == {2013, 8, 7}
  end

  test "first thursday of september 2013" do
    assert Meetup.meetup(2013, 9, :thursday, :first) == {2013, 9, 5}
  end

  test "first thursday of october 2013" do
    assert Meetup.meetup(2013, 10, :thursday, :first) == {2013, 10, 3}
  end

  test "first friday of november 2013" do
    assert Meetup.meetup(2013, 11, :friday, :first) == {2013, 11, 1}
  end

  test "first friday of december 2013" do
    assert Meetup.meetup(2013, 12, :friday, :first) == {2013, 12, 6}
  end

  test "first saturday of january 2013" do
    assert Meetup.meetup(2013, 1, :saturday, :first) == {2013, 1, 5}
  end

  test "first saturday of february 2013" do
    assert Meetup.meetup(2013, 2, :saturday, :first) == {2013, 2, 2}
  end

  test "first sunday of march 2013" do
    assert Meetup.meetup(2013, 3, :sunday, :first) == {2013, 3, 3}
  end

  test "first sunday of april 2013" do
    assert Meetup.meetup(2013, 4, :sunday, :first) == {2013, 4, 7}
  end

  test "second monday of march 2013" do
    assert Meetup.meetup(2013, 3, :monday, :second) == {2013, 3, 11}
  end

  test "second monday of april 2013" do
    assert Meetup.meetup(2013, 4, :monday, :second) == {2013, 4, 8}
  end

  test "second tuesday of may 2013" do
    assert Meetup.meetup(2013, 5, :tuesday, :second) == {2013, 5, 14}
  end

  test "second tuesday of june 2013" do
    assert Meetup.meetup(2013, 6, :tuesday, :second) == {2013, 6, 11}
  end

  test "second wednesday of july 2013" do
    assert Meetup.meetup(2013, 7, :wednesday, :second) == {2013, 7, 10}
  end

  test "second wednesday of august 2013" do
    assert Meetup.meetup(2013, 8, :wednesday, :second) == {2013, 8, 14}
  end

  test "second thursday of september 2013" do
    assert Meetup.meetup(2013, 9, :thursday, :second) == {2013, 9, 12}
  end

  test "second thursday of october 2013" do
    assert Meetup.meetup(2013, 10, :thursday, :second) == {2013, 10, 10}
  end

  test "second friday of november 2013" do
    assert Meetup.meetup(2013, 11, :friday, :second) == {2013, 11, 8}
  end

  test "second friday of december 2013" do
    assert Meetup.meetup(2013, 12, :friday, :second) == {2013, 12, 13}
  end

  test "second saturday of january 2013" do
    assert Meetup.meetup(2013, 1, :saturday, :second) == {2013, 1, 12}
  end

  test "second saturday of february 2013" do
    assert Meetup.meetup(2013, 2, :saturday, :second) == {2013, 2, 9}
  end

  test "second sunday of march 2013" do
    assert Meetup.meetup(2013, 3, :sunday, :second) == {2013, 3, 10}
  end

  test "second sunday of april 2013" do
    assert Meetup.meetup(2013, 4, :sunday, :second) == {2013, 4, 14}
  end

  test "third monday of march 2013" do
    assert Meetup.meetup(2013, 3, :monday, :third) == {2013, 3, 18}
  end

  test "third monday of april 2013" do
    assert Meetup.meetup(2013, 4, :monday, :third) == {2013, 4, 15}
  end

  test "third tuesday of may 2013" do
    assert Meetup.meetup(2013, 5, :tuesday, :third) == {2013, 5, 21}
  end

  test "third tuesday of june 2013" do
    assert Meetup.meetup(2013, 6, :tuesday, :third) == {2013, 6, 18}
  end

  test "third wednesday of july 2013" do
    assert Meetup.meetup(2013, 7, :wednesday, :third) == {2013, 7, 17}
  end

  test "third wednesday of august 2013" do
    assert Meetup.meetup(2013, 8, :wednesday, :third) == {2013, 8, 21}
  end

  test "third thursday of september 2013" do
    assert Meetup.meetup(2013, 9, :thursday, :third) == {2013, 9, 19}
  end

  test "third thursday of october 2013" do
    assert Meetup.meetup(2013, 10, :thursday, :third) == {2013, 10, 17}
  end

  test "third friday of november 2013" do
    assert Meetup.meetup(2013, 11, :friday, :third) == {2013, 11, 15}
  end

  test "third friday of december 2013" do
    assert Meetup.meetup(2013, 12, :friday, :third) == {2013, 12, 20}
  end

  test "third saturday of january 2013" do
    assert Meetup.meetup(2013, 1, :saturday, :third) == {2013, 1, 19}
  end

  test "third saturday of february 2013" do
    assert Meetup.meetup(2013, 2, :saturday, :third) == {2013, 2, 16}
  end

  test "third sunday of march 2013" do
    assert Meetup.meetup(2013, 3, :sunday, :third) == {2013, 3, 17}
  end

  test "third sunday of april 2013" do
    assert Meetup.meetup(2013, 4, :sunday, :third) == {2013, 4, 21}
  end

  test "fourth monday of march 2013" do
    assert Meetup.meetup(2013, 3, :monday, :fourth) == {2013, 3, 25}
  end

  test "fourth monday of april 2013" do
    assert Meetup.meetup(2013, 4, :monday, :fourth) == {2013, 4, 22}
  end

  test "fourth tuesday of may 2013" do
    assert Meetup.meetup(2013, 5, :tuesday, :fourth) == {2013, 5, 28}
  end

  test "fourth tuesday of june 2013" do
    assert Meetup.meetup(2013, 6, :tuesday, :fourth) == {2013, 6, 25}
  end

  test "fourth wednesday of july 2013" do
    assert Meetup.meetup(2013, 7, :wednesday, :fourth) == {2013, 7, 24}
  end

  test "fourth wednesday of august 2013" do
    assert Meetup.meetup(2013, 8, :wednesday, :fourth) == {2013, 8, 28}
  end

  test "fourth thursday of september 2013" do
    assert Meetup.meetup(2013, 9, :thursday, :fourth) == {2013, 9, 26}
  end

  test "fourth thursday of october 2013" do
    assert Meetup.meetup(2013, 10, :thursday, :fourth) == {2013, 10, 24}
  end

  test "fourth friday of november 2013" do
    assert Meetup.meetup(2013, 11, :friday, :fourth) == {2013, 11, 22}
  end

  test "fourth friday of december 2013" do
    assert Meetup.meetup(2013, 12, :friday, :fourth) == {2013, 12, 27}
  end

  test "fourth saturday of january 2013" do
    assert Meetup.meetup(2013, 1, :saturday, :fourth) == {2013, 1, 26}
  end

  test "fourth saturday of february 2013" do
    assert Meetup.meetup(2013, 2, :saturday, :fourth) == {2013, 2, 23}
  end

  test "fourth sunday of march 2013" do
    assert Meetup.meetup(2013, 3, :sunday, :fourth) == {2013, 3, 24}
  end

  test "fourth sunday of april 2013" do
    assert Meetup.meetup(2013, 4, :sunday, :fourth) == {2013, 4, 28}
  end

  test "last monday of march 2013" do
    assert Meetup.meetup(2013, 3, :monday, :last) == {2013, 3, 25}
  end

  test "last monday of april 2013" do
    assert Meetup.meetup(2013, 4, :monday, :last) == {2013, 4, 29}
  end

  test "last tuesday of may 2013" do
    assert Meetup.meetup(2013, 5, :tuesday, :last) == {2013, 5, 28}
  end

  test "last tuesday of june 2013" do
    assert Meetup.meetup(2013, 6, :tuesday, :last) == {2013, 6, 25}
  end

  test "last wednesday of july 2013" do
    assert Meetup.meetup(2013, 7, :wednesday, :last) == {2013, 7, 31}
  end

  test "last wednesday of august 2013" do
    assert Meetup.meetup(2013, 8, :wednesday, :last) == {2013, 8, 28}
  end

  test "last thursday of september 2013" do
    assert Meetup.meetup(2013, 9, :thursday, :last) == {2013, 9, 26}
  end

  test "last thursday of october 2013" do
    assert Meetup.meetup(2013, 10, :thursday, :last) == {2013, 10, 31}
  end

  test "last friday of november 2013" do
    assert Meetup.meetup(2013, 11, :friday, :last) == {2013, 11, 29}
  end

  test "last friday of december 2013" do
    assert Meetup.meetup(2013, 12, :friday, :last) == {2013, 12, 27}
  end

  test "last saturday of january 2013" do
    assert Meetup.meetup(2013, 1, :saturday, :last) == {2013, 1, 26}
  end

  test "last saturday of february 2013" do
    assert Meetup.meetup(2013, 2, :saturday, :last) == {2013, 2, 23}
  end

  test "last sunday of march 2013" do
    assert Meetup.meetup(2013, 3, :sunday, :last) == {2013, 3, 31}
  end

  test "last sunday of april 2013" do
    assert Meetup.meetup(2013, 4, :sunday, :last) == {2013, 4, 28}
  end
end

