defmodule SplitSecondStopwatch do
  @doc """
  A stopwatch that can be used to track lap times.
  """

  @type state :: :ready | :running | :stopped

  defmodule Stopwatch do
    @type t :: :todo
    defstruct [:todo]
  end

  @spec new() :: Stopwatch.t()
  def new() do
  end

  @spec state(Stopwatch.t()) :: state()
  def state(stopwatch) do
  end

  @spec current_lap(Stopwatch.t()) :: Time.t()
  def current_lap(stopwatch) do
  end

  @spec previous_laps(Stopwatch.t()) :: [Time.t()]
  def previous_laps(stopwatch) do
  end

  @spec advance_time(Stopwatch.t(), Time.t()) :: Stopwatch.t()
  def advance_time(stopwatch, time) do
  end

  @spec total(Stopwatch.t()) :: Time.t()
  def total(stopwatch) do
  end

  @spec start(Stopwatch.t()) :: Stopwatch.t() | {:error, String.t()}
  def start(stopwatch) do
  end

  @spec stop(Stopwatch.t()) :: Stopwatch.t() | {:error, String.t()}
  def stop(stopwatch) do
  end

  @spec lap(Stopwatch.t()) :: Stopwatch.t() | {:error, String.t()}
  def lap(stopwatch) do
  end

  @spec reset(Stopwatch.t()) :: Stopwatch.t() | {:error, String.t()}
  def reset(stopwatch) do
  end
end
