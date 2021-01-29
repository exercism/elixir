defmodule Clock do
  defstruct hour: 0, minute: 0
  @type t :: %Clock{hour: integer, minute: integer}
  @type t(hour, minute) :: %Clock{hour: hour, minute: minute}

  @doc """
  Returns a string representation of a clock:

      iex> Clock.new(8, 9) |> to_string
      "08:09"
  """
  @spec new(integer, integer) :: Clock.t()
  def new(hour, minute) do
    rollover(%Clock{hour: hour, minute: minute})
  end

  @doc """
  Adds two clock times:

      iex> Clock.new(10, 0) |> Clock.add(3) |> to_string
      "10:03"
  """
  @spec add(Clock.t(), integer) :: Clock.t()
  def add(%Clock{hour: hour, minute: minute}, add_minute) do
    new(hour, minute + add_minute)
  end

  defp rollover(%Clock{hour: hour, minute: minute}) do
    {carry_hour, minute} = roll_minute(minute)
    %Clock{hour: roll_hour(hour + carry_hour), minute: minute}
  end

  defp roll_hour(hour) when hour < 0 and rem(hour, 24) == 0, do: 0
  defp roll_hour(hour) when hour < 0, do: 24 + rem(hour, 24)
  defp roll_hour(hour) when hour >= 24, do: rem(hour, 24)
  defp roll_hour(hour), do: hour

  defp roll_minute(minute) when minute < 0 do
    {div(minute, 60) - 1, 60 + rem(minute, 60)}
  end

  defp roll_minute(minute) when minute >= 60 do
    {div(minute, 60), rem(minute, 60)}
  end

  defp roll_minute(minute), do: {0, minute}

  defimpl String.Chars, for: Clock do
    def to_string(%Clock{hour: hour, minute: minute}) do
      "#{format(hour)}:#{format(minute)}"
    end

    defp format(number) do
      number |> Integer.to_string() |> String.pad_leading(2, "0")
    end
  end
end
