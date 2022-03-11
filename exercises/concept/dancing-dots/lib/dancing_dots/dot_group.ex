defmodule DancingDots.DotGroup do
  defstruct [:dots, :animations_with_opts]
  @type t :: %__MODULE__{}

  @spec new([DancingDots.Dot.t()], [{module, any}]) ::
          {:ok, DancingDots.DotGroup.t()} | {:error, atom, {module, any}}
  def new(dots, animations_with_opts) do
    animations_with_opts_or_error =
      Enum.reduce_while(animations_with_opts, [], fn {animation_module, opts}, acc ->
        init_result = animation_module.init(opts)

        case init_result do
          {:error, error} -> {:halt, {animation_module, {:error, error, opts}}}
          {:ok, opts} -> {:cont, [{animation_module, opts} | acc]}
        end
      end)

    case animations_with_opts_or_error do
      animations_with_opts when is_list(animations_with_opts) ->
        {:ok,
         %__MODULE__{
           dots: dots,
           animations_with_opts: animations_with_opts_or_error
         }}

      {animation_module, {:error, error}} ->
        {:error, :invalid_animation_module_opts, {animation_module, error}}
    end
  end

  @spec render_dots(DancingDots.DotGroup.t(), DancingDots.Animation.frame_number()) :: [
          DancingDots.Dot.t()
        ]
  def render_dots(dot_group, frame_number) do
    %{
      dots: dots,
      animations_with_opts: animations_with_opts
    } = dot_group

    Enum.map(dots, fn dot ->
      Enum.reduce(animations_with_opts, dot, fn {animation_module, opts} ->
        animation_module.handle_frame(dot, frame_number, opts)
      end)
    end)
  end
end
