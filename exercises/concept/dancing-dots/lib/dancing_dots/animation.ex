defmodule DancingDots do
  defmodule Animation do
    @type dot :: DancingDots.Dot.t()
    @type opts :: any
    @type frame_number :: pos_integer

    @callback init(opts) :: {:ok, opts} | {:error, any}
    @callback handle_frame(dot, frame_number, opts) :: dot

    defmacro __using__(_opts) do
      quote do
        @behaviour DancingDots.Animation
        def init(opts), do: {:ok, []}
        defoverridable init: 1
      end
    end
  end

  defmodule Flicker do
    use Animation

    @impl Animation
    def handle_frame(dot, frame_number, _opts) do
      opacity = if rem(frame_number, 4) == 3, do: 0.5, else: dot.opacity
      %{dot | opacity: opacity}
    end
  end

  defmodule Zoom do
    use Animation

    @impl Animation
    def init(opts) do
      velocity = Keyword.get(opts, :velocity)

      if is_number(velocity) do
        {:ok, velocity}
      else
        {:error, "Expected required option :velocity to be a number, got: #{inspect(velocity)}"}
      end
    end

    @impl Animation
    def handle_frame(dot, frame_number, opts) do
      %{dot | radius: dot.radius + opts[:velocity] * frame_number}
    end
  end
end
