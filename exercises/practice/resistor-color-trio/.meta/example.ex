defmodule ResistorColorTrio do
  @colors %{
    black: 0,
    brown: 1,
    red: 2,
    orange: 3,
    yellow: 4,
    green: 5,
    blue: 6,
    violet: 7,
    grey: 8,
    white: 9
  }

  @doc """
  Calculate the resistance value in ohms from resistor colors
  """
  @spec label(colors :: [atom]) :: {number, :ohms | :kiloohms | :megaohms | :gigaohms}
  def label([a, b, c | _rest]) do
    value = (10 * @colors[a] + @colors[b]) * round(:math.pow(10, @colors[c]))

    cond do
      value >= 1_000_000_000 ->
        {div(value, 1_000_000_000), :gigaohms}

      value >= 1_000_000 ->
        {div(value, 1_000_000), :megaohms}

      value >= 1_000 ->
        {div(value, 1_000), :kiloohms}

      true ->
        {value, :ohms}
    end
  end
end
