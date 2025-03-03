defmodule SwiftScheduling do
  @doc """
  Convert delivery date descriptions to actual delivery dates, based on when the meeting started.
  """
  @spec delivery_date(NaiveDateTime.t(), String.t()) :: NaiveDateTime.t()
  def delivery_date(meeting_date, description) do
  end
end
