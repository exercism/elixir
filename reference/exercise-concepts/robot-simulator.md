# Concepts for `robot-simulator`

## Example solutions

By numberMumbler ([solution link](https://exercism.io/tracks/elixir/exercises/robot-simulator/solutions/b5d52f2870e74094ab3a74fc7108a82b))

```elixir
defmodule RobotSimulator do
  defguardp is_valid_direction(direction) when direction in [:north, :east, :south, :west]

  defguardp is_valid_position(position)
            when is_tuple(position) and
                   tuple_size(position) == 2 and
                   is_integer(elem(position, 0)) and
                   is_integer(elem(position, 1))

  @doc """
  Create a Robot Simulator given an initial direction and position.

  Valid directions are: `:north`, `:east`, `:south`, `:west`
  """
  def create(direction, _) when not is_valid_direction(direction) do
    {:error, "invalid direction"}
  end

  def create(_, position) when not is_valid_position(position) do
    {:error, "invalid position"}
  end

  @spec create(direction :: atom, position :: {integer, integer}) :: any
  def create(direction \\ :north, position \\ {0, 0}) do
    %{direction: direction, position: position}
  end

  @doc """
  Simulate the robot's movement given a string of instructions.

  Valid instructions are: "R" (turn right), "L", (turn left), and "A" (advance)
  """
  @spec simulate(robot :: any, instructions :: String.t()) :: any
  def simulate(robot, instructions) do
    instructions
    |> String.upcase()
    |> String.graphemes()
    |> Enum.reduce(robot, &update/2)
  end

  @doc """
  Return the robot's direction.

  Valid directions are: `:north`, `:east`, `:south`, `:west`
  """
  @spec direction(robot :: any) :: atom
  def direction(robot), do: robot.direction

  @doc """
  Return the robot's position.
  """
  @spec position(robot :: any) :: {integer, integer}
  def position(robot), do: robot.position

  # Update the robot with the result of the instruction
  defp update(_, {:error, message}), do: {:error, message}

  defp update("R", %{direction: direction, position: position}) do
    %{direction: turn_right(direction), position: position}
  end

  defp update("L", %{direction: direction, position: position}) do
    %{direction: turn_left(direction), position: position}
  end

  defp update("A", %{direction: direction, position: position}) do
    %{direction: direction, position: advance(direction, position)}
  end

  defp update(_, _), do: {:error, "invalid instruction"}

  # Get the result of the instructions
  defp turn_right(:north), do: :east
  defp turn_right(:east), do: :south
  defp turn_right(:south), do: :west
  defp turn_right(:west), do: :north

  defp turn_left(:north), do: :west
  defp turn_left(:east), do: :north
  defp turn_left(:south), do: :east
  defp turn_left(:west), do: :south

  defp advance(:north, {x, y}), do: {x, y + 1}
  defp advance(:east, {x, y}), do: {x + 1, y}
  defp advance(:south, {x, y}), do: {x, y - 1}
  defp advance(:west, {x, y}), do: {x - 1, y}
end
```

[Canonical](https://github.com/exercism/elixir/blob/master/exercises/robot-simulator/example.exs)

```elixir
defmodule RobotSimulator do
  defstruct direction: nil, position: nil

  @valid_directions [:north, :east, :south, :west]

  @doc """
  Create a Robot Simulator given an initial direction and position.
  Valid directions are: `:north`, `:east`, `:south`, `:west`
  """
  @spec create(direction :: atom, position :: {integer, integer}) :: any
  def create(direction \\ :north, position \\ {0, 0}) do
    %RobotSimulator{} |> place(position) |> orient(direction)
  end

  @doc """
  Simulate the robot's movement given a string of instructions.
  Valid instructions are: "R" (turn right), "L", (turn left), and "A" (advance)
  """
  @spec simulate(robot :: %RobotSimulator{}, instructions :: String.t()) :: any
  def simulate(%RobotSimulator{} = robot, instructions) do
    instructions |> String.graphemes() |> Enum.reduce(robot, &move/2)
  end

  def position(%RobotSimulator{position: pos}), do: pos
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
```

## List of concepts

- naming
- functions
  - arity
  - higher-order functions
  - one-line syntax
  - multi-line syntax
  - multi-headed functions
  - default arguments
  - pipelines
  - capture syntax (`&`)
- modules
  - module attributes
  - visibility (`def`/`defp`)
- immutability
- pattern matching
  - `:ok`/`:error` tuples
- types
  - integer
  - atom
  - tuple
  - list
  - string
    - `String.graphemes/1`
    - `String.upcase/1`
  - struct
    - struct update syntax
- collections
  - `Enum`
    - `chunk_every/3`
    - `reduce/2`
    - `take/2`
  - `Stream`
    - `cycle/1`
  - `for` loop
- typespecs
