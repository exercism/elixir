defmodule RobotSimulator do
  defstruct direction: nil, position: nil

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
  def create(direction, position) do
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
  end
end
