defmodule RobotSimulator do
  defstruct direction: nil, position: nil

  @valid_directions [:north, :east, :south, :west]

  @doc """
  Create a Robot Simulator given an initial direction and position.

  Valid directions are: `:north`, `:east`, `:south`, `:west`

  ## Examples

  iex> RobotSimulator.create(:north, {0, 0})
  { :ok, %RobotSimulator{ direction: :north, position: {0, 0} } }

  iex> RobotSimulator.create(:invalid, {0, 0})
  { :error, "invalid direction" }

  iex> RobotSimulator.create(:north, "invalid")
  { :error, "invalid position" }
  """
  @spec create(direction :: atom, position :: {integer, integer}) :: { atom, any }
  def create(direction \\ :north, position \\ {0, 0}) do
    { :ok, %RobotSimulator{} } |> place(position) |> orient(direction)
  end

  @doc """
  Simulate the robot's movement given a string of instructions.

  Valid instructions are: "R" (turn right), "L", (turn left), and "A" (advance)

  ## Examples

  iex> { :ok, robot } = RobotSimulator.create
  iex> robot |> RobotSimulator.simulate("RRLAAR")
  { :ok, %RobotSimulator{direction: :south, position: {2, 0}} }

  iex> { :ok, robot } = RobotSimulator.create
  iex> robot |> RobotSimulator.simulate("RRLAUR")
  { :error, "invalid instruction" }
  """
  @spec simulate(robot :: %RobotSimulator{}, instructions :: String.t ) :: { atom, any }
  def simulate(%RobotSimulator{} = robot, instructions) do
    instructions |> String.graphemes |> Enum.reduce({ :ok, robot }, &move/2)
  end

  defp orient({ :ok, %RobotSimulator{} = robot }, direction) when direction in @valid_directions do
    { :ok, %RobotSimulator{ robot | direction: direction } }
  end
  defp orient({ :error, _ } = error, _), do: error
  defp orient(_, _), do: { :error, "invalid direction" }

  defp place({ :ok, %RobotSimulator{} = robot }, { x, y } = position) when is_integer(x) and is_integer(y) do
    { :ok, %RobotSimulator{ robot | position: position } }
  end
  defp place({ :error, _ } = error, _), do: error
  defp place(_, _), do: { :error, "invalid position" }

  defp move("R", { :ok, %RobotSimulator{ direction: direction } } = robot), do: robot |> orient(direction |> rotate_right)
  defp move("L", { :ok, %RobotSimulator{ direction: direction } } = robot), do: robot |> orient(direction |> rotate_left)
  defp move("A", { :ok, %RobotSimulator{ direction: :north, position: { x, y } } } = robot), do: robot |> place({ x, y + 1 })
  defp move("A", { :ok, %RobotSimulator{ direction: :east, position: { x, y } } } = robot), do: robot |> place({ x + 1, y })
  defp move("A", { :ok, %RobotSimulator{ direction: :south, position: { x, y } } } = robot), do: robot |> place({ x, y - 1 })
  defp move("A", { :ok, %RobotSimulator{ direction: :west, position: { x, y } } } = robot), do: robot |> place({ x - 1, y })
  defp move(_, { :error, _ } = error), do: error
  defp move(_, _), do: { :error, "invalid instruction" }

  for [curr, right] <- @valid_directions |> Stream.cycle |> Enum.take(5) |> Enum.chunk(2, 1) do
    defp rotate_right(unquote(curr)), do: unquote(right)
    defp rotate_left(unquote(right)), do: unquote(curr)
  end
end
