defmodule Tournament do
  @stats_header {"Team", "MP", "W", "D", "L", "P"}
  @initial_stats {0, 0, 0, 0, 0}

  @doc """
  Given `input` lines representing two teams and whether the first of them won,
  lost, or reached a draw, separated by semicolons, calculate the statistics
  for each team's number of games played, won, drawn, lost, and total points
  for the season, and return a nicely-formatted string table.

  A win earns a team 3 points, a draw earns 1 point, and a loss earns nothing.

  Order the outcome by most total points for the season, and settle ties by
  listing the teams in alphabetical order.
  """
  @spec tally(input :: list(String.t())) :: String.t()
  def tally(input) do
    %{}
    |> do_tally(input)
    |> Enum.into([], fn {k, v} -> Tuple.insert_at(v, 0, k) end)
    |> Enum.sort(&sort_results/2)
    |> List.insert_at(0, @stats_header)
    |> Enum.map_join("\n", &format_results/1)
  end

  defp do_tally(results, []), do: results

  defp do_tally(results, [line | rest]) do
    results
    |> parse_line(line |> String.split(";", trim: true))
    |> do_tally(rest)
  end

  defp parse_line(results, [first, second, "win"]) do
    results |> mark_win(first) |> mark_loss(second)
  end

  defp parse_line(results, [first, second, "draw"]) do
    results |> mark_draw(first) |> mark_draw(second)
  end

  defp parse_line(results, [first, second, "loss"]) do
    results |> mark_loss(first) |> mark_win(second)
  end

  defp parse_line(results, _), do: results

  defp mark_win(results, team) do
    {played, wins, draws, lost, points} = Map.get(results, team, @initial_stats)

    Map.put(results, team, {played + 1, wins + 1, draws, lost, points + 3})
  end

  defp mark_draw(results, team) do
    {played, wins, draws, lost, points} = Map.get(results, team, @initial_stats)

    Map.put(results, team, {played + 1, wins, draws + 1, lost, points + 1})
  end

  defp mark_loss(results, team) do
    {played, wins, draws, lost, points} = Map.get(results, team, @initial_stats)

    Map.put(results, team, {played + 1, wins, draws, lost + 1, points})
  end

  defp sort_results({_, _, _, _, _, points_a}, {_, _, _, _, _, points_b})
       when points_a > points_b,
       do: true

  defp sort_results({_, _, _, _, _, points_a}, {_, _, _, _, _, points_b})
       when points_a < points_b,
       do: false

  defp sort_results({name_a, _, _, _, _, _}, {name_b, _, _, _, _, _}) when name_a <= name_b,
    do: true

  defp sort_results(_, _), do: false

  defp format_results({name, played, wins, draws, lost, points}) do
    [
      name |> String.pad_trailing(30),
      played |> to_string |> String.pad_leading(2),
      wins |> to_string |> String.pad_leading(2),
      draws |> to_string |> String.pad_leading(2),
      lost |> to_string |> String.pad_leading(2),
      points |> to_string |> String.pad_leading(2)
    ]
    |> Enum.join(" | ")
  end
end
