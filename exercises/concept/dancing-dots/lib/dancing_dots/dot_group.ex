defmodule DancingDots.DotGroup do
  # This module is an example of how behaviours can be used in practice.
  # You don't need to read it to solve this exercise.
  # It's here for the curious :)

  @moduledoc """
  Allows applying a list of one or more animations to a group of one or more dots.
  """

  defstruct [:dots, :animations_with_opts]
  @type t :: %__MODULE__{}

  @doc """
  Validates the given animation modules with their given options.
  """
  @spec new([DancingDots.Dot.t()], [{module, DancingDots.Animation.opts()}]) ::
          {:ok, t()} | {:error, atom, {module, DancingDots.Animation.error()}}
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

  @doc """
  Applies the list of animations to all the dots.
  """
  @spec render_dots(t(), DancingDots.Animation.frame_number()) :: [DancingDots.Dot.t()]
  def render_dots(dot_group, frame_number) do
    %{
      dots: dots,
      animations_with_opts: animations_with_opts
    } = dot_group

    Enum.map(dots, fn dot ->
      Enum.reduce(animations_with_opts, dot, fn {animation_module, opts}, acc ->
        animation_module.handle_frame(acc, frame_number, opts)
      end)
    end)
  end
end
