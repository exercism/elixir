defmodule SplitSecondStopwatch do
  @doc """
  A stopwatch that can be used to track lap times.
  """

  @type state :: :ready | :running | :stopped

  defmodule Stopwatch do
    defstruct [:todo]
  end

  @spec new() :: Stopwatch.t()
  def new() do
  end

  @spec state(Stopwatch.t()) :: state()
  def state(stopwatch) do
  end

  @spec current_lap(Stopwatch.t()) :: Duration.t()
  def current_lap(stopwatch) do
  end

  @spec previous_laps(Stopwatch.t()) :: [Duration.t()]
  def previous_laps(stopwatch) do
  end

  @spec total(Stopwatch.t()) :: Duration.t()
  def total(stopwatch) do
  end

  @spec advance_time(Stopwatch.t(), Duration.t()) :: Stopwatch.t()
  def advance_time(stopwatch, duration) do
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
