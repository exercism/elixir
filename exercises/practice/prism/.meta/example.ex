defmodule Prism do
  @doc """
  Finds the sequence of prisms that the laser will hit.
  """

  @type start :: %{angle: number(), x: number(), y: number()}
  @type prism :: %{id: integer(), angle: number(), x: number(), y: number()}

  @spec find_sequence(prisms :: [prism()], start :: start()) :: [integer()]
  def find_sequence(prisms, start) do
    find_next_prism(start, prisms, [])
  end

  @precision 0.01
  defp find_next_prism(start, prisms, sequence) do
    next_prism =
      prisms
      |> Enum.filter(fn %{x: x, y: y} ->
        different_prism? = x != start.x or y != start.y

        angle_to_prism = :math.atan2(y - start.y, x - start.x) / :math.pi() * 180
        angle_difference = abs(:math.fmod(angle_to_prism - start.angle, 360))

        pointing_to_prism? =
          angle_difference < @precision or 360 - angle_difference < @precision

        different_prism? and pointing_to_prism?
      end)
      |> Enum.min_by(
        fn %{x: x, y: y} -> (x - start.x) ** 2 + (y - start.y) ** 2 end,
        &<=/2,
        fn -> nil end
      )

    case next_prism do
      nil ->
        Enum.reverse(sequence)

      %{id: id, angle: angle, x: x, y: y} ->
        next_start = %{angle: start.angle + angle, x: x, y: y}
        find_next_prism(next_start, prisms, [id | sequence])
    end
  end
end
