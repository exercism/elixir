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
  end
end
