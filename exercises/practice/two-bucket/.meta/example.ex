defmodule TwoBucket do
  defstruct [:goal, :moves, :other_bucket]
  @type t :: %TwoBucket{goal: :one | :two, moves: integer, other_bucket: integer}

  @doc """
  Find the quickest way to fill a bucket with some amount of water from two buckets of specific sizes.
  """
  @spec measure(
          size_one :: integer,
          size_two :: integer,
          goal :: integer,
          start_bucket :: :one | :two
        ) :: {:ok, TwoBucket.t()} | {:error, :impossible}
  def measure(size_one, size_two, goal, start_bucket) do
    other_filled = if start_bucket == :one, do: {0, size_two}, else: {size_one, 0}
    forbidden_states = MapSet.new([other_filled])

    # Partially apply function to avoid passing many arguments
    next_moves = &next_moves(&1, size_one, size_two)

    pour([{{0, 0}, 0}], forbidden_states, next_moves, goal)
  end

  def pour([], _, _, _), do: {:error, :impossible}

  def pour([{{goal, other}, moves} | _], _, _, goal),
    do: {:ok, %TwoBucket{goal: :one, moves: moves, other_bucket: other}}

  def pour([{{other, goal}, moves} | _], _, _, goal),
    do: {:ok, %TwoBucket{goal: :two, moves: moves, other_bucket: other}}

  def pour([{state, moves} | states], forbidden_states, next_moves, goal) do
    next =
      next_moves.(state)
      |> Enum.reject(&MapSet.member?(forbidden_states, &1))
      |> Enum.map(&{&1, moves + 1})

    pour(states ++ next, MapSet.put(forbidden_states, state), next_moves, goal)
  end

  def next_moves({fill_one, fill_two}, size_one, size_two) do
    [
      # Empty a bucket
      {0, fill_two},
      {fill_one, 0},
      # Fill a bucket
      {fill_one, size_two},
      {size_one, fill_two},
      # Pour one into the other
      {min(size_one, fill_one + fill_two), max(0, fill_two - size_one + fill_one)},
      {max(0, fill_one - size_two + fill_two), min(size_two, fill_one + fill_two)}
    ]
    |> Enum.uniq()
  end
end
