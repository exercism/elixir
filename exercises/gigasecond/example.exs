defmodule Gigasecond do
  def from(time) do
    seconds = :calendar.datetime_to_gregorian_seconds(time)
    :calendar.gregorian_seconds_to_datetime(seconds + 1000000000)
  end
end
