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
  Calculate the resistance value in ohm or kiloohm from resistor colors
  """
  @spec label(colors :: [atom]) :: {integer, atom}
  def label([a, b, c]) do
    value = (10 * @colors[a] + @colors[b]) * round(:math.pow(10, @colors[c]))

    if value >= 1000 do
      {div(value, 1000), :kiloohms}
    else
      {value, :ohms}
    end
  end
end
