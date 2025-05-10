defmodule SplitSecondStopwatch do
  @doc """
  A stopwatch that can be used to track lap times.
  """

  @type state :: :ready | :running | :stopped

  defmodule Stopwatch do
    defstruct [:state, :current_lap, :previous_laps]
  end

  @spec new() :: Stopwatch.t()
  def new() do
    %Stopwatch{state: :ready, current_lap: zero(), previous_laps: []}
  end

  @spec state(Stopwatch.t()) :: state()
  def state(%Stopwatch{state: state}) do
    state
  end

  @spec current_lap(Stopwatch.t() :: Duration.t())
  def current_lap(%Stopwatch{current_lap: current_lap}) do
    current_lap
  end

  @spec previous_laps(Stopwatch.t()) :: [Duration.t()]
  def previous_laps(%Stopwatch{previous_laps: previous_laps}) do
    Enum.reverse(previous_laps)
  end

  @spec advance_time(Stopwatch.t(), Duration.t()) :: Stopwatch.t()
  def advance_time(%Stopwatch{state: :running, current_lap: current_lap} = stopwatch, duration) do
    current_lap =
      current_lap
      |> Duration.add(duration)
      |> normalize()

    %Stopwatch{stopwatch | current_lap: current_lap}
  end

  @spec total(Stopwatch.t()) :: Duration.t()
  def total(%Stopwatch{current_lap: current_lap, previous_laps: previous_laps}) do
    previous_laps
    |> Enum.reduce(current_lap, &Duration.add/2)
    |> normalize()
  end

  def advance_time(%Stopwatch{} = stopwatch, _duration) do
    stopwatch
  end

  @spec start(Stopwatch.t()) :: Stopwatch.t() | {:error, String.t()}
  def start(%Stopwatch{state: :running}) do
    {:error, "cannot start an already running stopwatch"}
  end

  def start(%Stopwatch{} = stopwatch) do
    %Stopwatch{stopwatch | state: :running}
  end

  @spec stop(Stopwatch.t()) :: Stopwatch.t() | {:error, String.t()}
  def stop(%Stopwatch{state: :running} = stopwatch) do
    %Stopwatch{stopwatch | state: :stopped}
  end

  def stop(%Stopwatch{}) do
    {:error, "cannot stop a stopwatch that is not running"}
  end

  @spec lap(Stopwatch.t()) :: Stopwatch.t() | {:error, String.t()}
  def lap(
        %Stopwatch{state: :running, current_lap: current_lap, previous_laps: previous_laps} =
          stopwatch
      ) do
    %Stopwatch{stopwatch | current_lap: zero(), previous_laps: [current_lap | previous_laps]}
  end

  def lap(%Stopwatch{}) do
    {:error, "cannot lap a stopwatch that is not running"}
  end

  @spec reset(Stopwatch.t()) :: Stopwatch.t() | {:error, String.t()}
  def reset(%Stopwatch{state: :stopped}) do
    new()
  end

  def reset(%Stopwatch{}) do
    {:error, "cannot reset a stopwatch that is not stopped"}
  end

  defp zero, do: Duration.new!(second: 0)

  defp normalize(%Duration{} = duration) do
    minute = duration.minute + div(duration.second, 60)
    second = rem(duration.second, 60)

    hour = duration.hour + div(minute, 60)
    minute = rem(minute, 60)

    Duration.new!(hour: hour, minute: minute, second: second)
  end
end
