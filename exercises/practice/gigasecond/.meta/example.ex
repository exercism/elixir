defmodule Gigasecond do
  def from(time) do
    seconds = :calendar.datetime_to_gregorian_seconds(time)
    :calendar.gregorian_seconds_to_datetime(seconds + 1_000_000_000)
  end
end
