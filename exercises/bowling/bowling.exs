defmodule Bowling do
  @type t :: any()

  @doc """
    Creates a new game of bowling that can be used to store the results of
    the game
  """
  @spec start() :: t()
  def start do
  end

  @doc """
    Records the number of pins knocked down on a single roll. Returns `any`
    unless there is something wrong with the given number of pins, in which
    case it returns a helpful error tuple.
  """

  @spec roll(t(), integer()) :: t() | {:error, String.t()}
  def roll(game, roll) do
  end

  @doc """
    Returns the score of a given game of bowling if the game is complete.
    If the game isn't complete, it returns a helpful error tuple.
  """

  @spec score(t()) :: integer() | {:error, String.t()}
  def score(game) do
  end
end
