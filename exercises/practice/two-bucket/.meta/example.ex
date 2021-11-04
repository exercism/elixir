defmodule TwoBucket do
  defstruct [:bucket_one, :bucket_two, :moves]
  @type t :: %TwoBucket{bucket_one: integer, bucket_two: integer, moves: integer}

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

  defp pour([], _, _, _), do: {:error, :impossible}

  defp pour([{{a, b}, moves} | _], _, _, goal) when a == goal or b == goal,
    do: {:ok, %TwoBucket{bucket_one: a, bucket_two: b, moves: moves}}

  defp pour([{state, moves} | states], forbidden_states, next_moves, goal) do
    next =
      next_moves.(state)
      |> Enum.reject(&MapSet.member?(forbidden_states, &1))
      |> Enum.map(&{&1, moves + 1})

    pour(states ++ next, MapSet.put(forbidden_states, state), next_moves, goal)
  end

  defp next_moves({fill_one, fill_two}, size_one, size_two) do
    [
      # Empty a bucket
      {0, fill_two},
      {fill_one, 0},
      # Fill a bucket
      {fill_one, size_two},
      {size_one, fill_two},
      # Pour one into the other
      if fill_one < size_two - fill_two do
        {0, fill_one + fill_two}
      else
        {fill_one - (size_two - fill_two), size_two}
      end,
      if fill_two < size_one - fill_one do
        {fill_one + fill_two, 0}
      else
        {size_one, fill_two - (size_one - fill_one)}
      end
    ]
    |> Enum.uniq()
  end
end
