defmodule SplitSecondStopwatch do
  @doc """
  A stopwatch that can be used to track lap times.
  """

  @type state :: :ready | :running | :stopped

  defmodule Stopwatch do
    @type t :: %Stopwatch{
            state: SplitSecondStopwatch.state(),
            current_lap: Time.t(),
            previous_laps: [Time.t()]
          }
    defstruct state: :ready, current_lap: ~T[00:00:00], previous_laps: []
  end

  @spec new() :: Stopwatch.t()
  def new() do
    %Stopwatch{}
  end

  @spec state(Stopwatch.t()) :: state()
  def state(%Stopwatch{state: state}) do
    state
  end

  @spec current_lap(Stopwatch.t()) :: Time.t()
  def current_lap(%Stopwatch{current_lap: current_lap}) do
    current_lap
  end

  @spec previous_laps(Stopwatch.t()) :: [Time.t()]
  def previous_laps(%Stopwatch{previous_laps: previous_laps}) do
    Enum.reverse(previous_laps)
  end

  @spec advance_time(Stopwatch.t(), Time.t()) :: Stopwatch.t()
  def advance_time(%Stopwatch{state: :running, current_lap: current_lap} = stopwatch, time) do
    current_lap = add_times(current_lap, time)
    %{stopwatch | current_lap: current_lap}
  end

  def advance_time(%Stopwatch{} = stopwatch, _time) do
    stopwatch
  end

  @spec total(Stopwatch.t()) :: Time.t()
  def total(%Stopwatch{current_lap: current_lap, previous_laps: previous_laps}) do
    Enum.reduce(previous_laps, current_lap, &add_times/2)
  end

  @spec start(Stopwatch.t()) :: Stopwatch.t() | {:error, String.t()}
  def start(%Stopwatch{state: :running}) do
    {:error, "cannot start an already running stopwatch"}
  end

  def start(%Stopwatch{} = stopwatch) do
    %{stopwatch | state: :running}
  end

  @spec stop(Stopwatch.t()) :: Stopwatch.t() | {:error, String.t()}
  def stop(%Stopwatch{state: :running} = stopwatch) do
    %{stopwatch | state: :stopped}
  end

  def stop(%Stopwatch{}) do
    {:error, "cannot stop a stopwatch that is not running"}
  end

  @spec lap(Stopwatch.t()) :: Stopwatch.t() | {:error, String.t()}
  def lap(%Stopwatch{state: :running} = stopwatch) do
    current_lap = ~T[00:00:00]
    previous_laps = [stopwatch.current_lap | stopwatch.previous_laps]

    %{stopwatch | current_lap: current_lap, previous_laps: previous_laps}
  end

  def lap(%Stopwatch{}) do
    {:error, "cannot lap a stopwatch that is not running"}
  end

  @spec reset(Stopwatch.t()) :: Stopwatch.t() | {:error, String.t()}
  def reset(%Stopwatch{state: :stopped}) do
    %Stopwatch{}
  end

  def reset(%Stopwatch{}) do
    {:error, "cannot reset a stopwatch that is not stopped"}
  end

  defp add_times(time1, time2) do
    {time2_in_seconds, _microseconds} = Time.to_seconds_after_midnight(time2)
    Time.add(time1, time2_in_seconds, :second)
  end
end
