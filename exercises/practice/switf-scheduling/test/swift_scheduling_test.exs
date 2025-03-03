defmodule SwiftSchedulingTest do
  use ExUnit.Case

  # @tag :pending
  test "NOW translates to two hours later" do
    meeting_date = ~N[2012-02-13T09:00:00]
    description = "NOW"
    expected_output = ~N[2012-02-13T11:00:00]

    output = SwiftScheduling.delivery_date(meeting_date, description)
    assert output == expected_output
  end

  @tag :pending
  test "ASAP before one in the afternoon translates to today at five in the afternoon" do
    meeting_date = ~N[1999-06-03T09:45:00]
    description = "ASAP"
    expected_output = ~N[1999-06-03T17:00:00]

    output = SwiftScheduling.delivery_date(meeting_date, description)
    assert output == expected_output
  end

  @tag :pending
  test "ASAP at one in the afternoon translates to tomorrow at one in the afternoon" do
    meeting_date = ~N[2008-12-21T13:00:00]
    description = "ASAP"
    expected_output = ~N[2008-12-22T13:00:00]

    output = SwiftScheduling.delivery_date(meeting_date, description)
    assert output == expected_output
  end

  @tag :pending
  test "ASAP after one in the afternoon translates to tomorrow at one in the afternoon" do
    meeting_date = ~N[2008-12-21T14:50:00]
    description = "ASAP"
    expected_output = ~N[2008-12-22T13:00:00]

    output = SwiftScheduling.delivery_date(meeting_date, description)
    assert output == expected_output
  end

  @tag :pending
  test "EOW on Monday translates to Friday at five in the afternoon" do
    meeting_date = ~N[2025-02-03T16:00:00]
    description = "EOW"
    expected_output = ~N[2025-02-07T17:00:00]

    output = SwiftScheduling.delivery_date(meeting_date, description)
    assert output == expected_output
  end

  @tag :pending
  test "EOW on Wednesday translates to Friday at five in the afternoon" do
    meeting_date = ~N[2005-09-14T11:00:00]
    description = "EOW"
    expected_output = ~N[2005-09-16T17:00:00]

    output = SwiftScheduling.delivery_date(meeting_date, description)
    assert output == expected_output
  end

  @tag :pending
  test "EOW on Thursday translates to Sunday at eight in the evening" do
    meeting_date = ~N[2011-05-19T08:30:00]
    description = "EOW"
    expected_output = ~N[2011-05-22T20:00:00]

    output = SwiftScheduling.delivery_date(meeting_date, description)
    assert output == expected_output
  end

  @tag :pending
  test "EOW on Friday translates to Sunday at eight in the evening" do
    meeting_date = ~N[2022-08-05T14:00:00]
    description = "EOW"
    expected_output = ~N[2022-08-07T20:00:00]

    output = SwiftScheduling.delivery_date(meeting_date, description)
    assert output == expected_output
  end

  @tag :pending
  test "EOW translates to leap day" do
    meeting_date = ~N[2008-02-25T10:30:00]
    description = "EOW"
    expected_output = ~N[2008-02-29T17:00:00]

    output = SwiftScheduling.delivery_date(meeting_date, description)
    assert output == expected_output
  end

  @tag :pending
  test "2M before the second month of this year translates to the first workday of the second month of this year" do
    meeting_date = ~N[2007-01-02T14:15:00]
    description = "2M"
    expected_output = ~N[2007-02-01T08:00:00]

    output = SwiftScheduling.delivery_date(meeting_date, description)
    assert output == expected_output
  end

  @tag :pending
  test "11M in the eleventh month translates to the first workday of the eleventh month of next year" do
    meeting_date = ~N[2013-11-21T15:30:00]
    description = "11M"
    expected_output = ~N[2014-11-03T08:00:00]

    output = SwiftScheduling.delivery_date(meeting_date, description)
    assert output == expected_output
  end

  @tag :pending
  test "4M in the ninth month translates to the first workday of the fourth month of next year" do
    meeting_date = ~N[2019-11-18T15:15:00]
    description = "4M"
    expected_output = ~N[2020-04-01T08:00:00]

    output = SwiftScheduling.delivery_date(meeting_date, description)
    assert output == expected_output
  end

  @tag :pending
  test "Q1 in the first quarter translates to the last workday of the first quarter of this year" do
    meeting_date = ~N[2003-01-01T10:45:00]
    description = "Q1"
    expected_output = ~N[2003-03-31T08:00:00]

    output = SwiftScheduling.delivery_date(meeting_date, description)
    assert output == expected_output
  end

  @tag :pending
  test "Q4 in the second quarter translates to the last workday of the fourth quarter of this year" do
    meeting_date = ~N[2001-04-09T09:00:00]
    description = "Q4"
    expected_output = ~N[2001-12-31T08:00:00]

    output = SwiftScheduling.delivery_date(meeting_date, description)
    assert output == expected_output
  end

  @tag :pending
  test "Q3 in the fourth quarter translates to the last workday of the third quarter of next year" do
    meeting_date = ~N[2022-10-06T11:00:00]
    description = "Q3"
    expected_output = ~N[2023-09-29T08:00:00]

    output = SwiftScheduling.delivery_date(meeting_date, description)
    assert output == expected_output
  end
end
