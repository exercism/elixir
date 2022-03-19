defmodule RobotSimulator do
  @type robot() :: any()
  @type direction() :: :north | :east | :south | :west
  @type position() :: {integer(), integer()}

  defstruct direction: nil, position: nil

  @valid_directions [:north, :east, :south, :west]

  @doc """
  Create a Robot Simulator given an initial direction and position.

  Valid directions are: `:north`, `:east`, `:south`, `:west`
  """
  @spec create(direction, position) :: robot() | {:error, String.t()}
  def create(direction \\ :north, position \\ {0, 0}) do
    %RobotSimulator{} |> place(position) |> orient(direction)
  end

  @doc """
  Simulate the robot's movement given a string of instructions.

  Valid instructions are: "R" (turn right), "L", (turn left), and "A" (advance)
  """
  @spec simulate(robot, instructions :: String.t()) :: robot() | {:error, String.t()}
  def simulate(%RobotSimulator{} = robot, instructions) do
    instructions |> String.graphemes() |> Enum.reduce(robot, &move/2)
  end

  @spec position(robot) :: position()
  def position(%RobotSimulator{position: pos}), do: pos

  @spec direction(robot) :: direction()
  def direction(%RobotSimulator{direction: dir}), do: dir

  defp orient(%RobotSimulator{} = robot, direction) when direction in @valid_directions do
    %{robot | direction: direction}
  end

  defp orient({:error, _} = error, _), do: error
  defp orient(_, _), do: {:error, "invalid direction"}

  defp place(%RobotSimulator{} = robot, {x, y} = position) when is_integer(x) and is_integer(y) do
    %{robot | position: position}
  end

  defp place(_, _), do: {:error, "invalid position"}

  defp move("R", %RobotSimulator{direction: direction} = robot),
    do: robot |> orient(direction |> rotate_right)

  defp move("L", %RobotSimulator{direction: direction} = robot),
    do: robot |> orient(direction |> rotate_left)

  defp move("A", %RobotSimulator{direction: :north, position: {x, y}} = robot),
    do: robot |> place({x, y + 1})

  defp move("A", %RobotSimulator{direction: :east, position: {x, y}} = robot),
    do: robot |> place({x + 1, y})

  defp move("A", %RobotSimulator{direction: :south, position: {x, y}} = robot),
    do: robot |> place({x, y - 1})

  defp move("A", %RobotSimulator{direction: :west, position: {x, y}} = robot),
    do: robot |> place({x - 1, y})

  defp move(_, {:error, _} = error), do: error
  defp move(_, _), do: {:error, "invalid instruction"}

  for [curr, right] <-
        @valid_directions |> Stream.cycle() |> Enum.take(5) |> Enum.chunk_every(2, 1) do
    defp rotate_right(unquote(curr)), do: unquote(right)
    defp rotate_left(unquote(right)), do: unquote(curr)
  end
end
