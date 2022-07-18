defmodule DancingDots.AnimationTest do
  use ExUnit.Case
  import ExUnit.CaptureIO

  describe "Animation module" do
    @tag task_id: 1
    test "defines two required callbacks, init/1 and handle_frame/3" do
      assert DancingDots.Animation.behaviour_info(:callbacks) == [{:init, 1}, {:handle_frame, 3}]
    end

    @tag task_id: 1
    test "defines no optional callbacks" do
      assert DancingDots.Animation.behaviour_info(:optional_callbacks) == []
    end

    @tag task_id: 2
    test "defines a __using__ macro" do
      assert macro_exported?(DancingDots.Animation, :__using__, 1)
    end

    @tag task_id: 2
    test "__using__ provides a default implementation of init/1" do
      defmodule TestAnimation1 do
        use DancingDots.Animation
        def handle_frame(dot, _frame_number, _opts), do: dot
      end

      assert function_exported?(TestAnimation1, :init, 1)
    end

    @tag task_id: 2
    test "the default implementation of init/1 returns opts unchanged" do
      defmodule TestAnimation2 do
        use DancingDots.Animation
        def handle_frame(dot, _frame_number, _opts), do: dot
      end

      assert TestAnimation2.init([]) == {:ok, []}
      assert TestAnimation2.init(:anything) == {:ok, :anything}
      assert TestAnimation2.init({1, 2, 3}) == {:ok, {1, 2, 3}}
    end

    @tag task_id: 2
    test "the default implementation of init/1 can be overridden" do
      defmodule TestAnimation3 do
        use DancingDots.Animation
        def init(_), do: {:ok, []}
        def handle_frame(dot, _frame_number, _opts), do: dot
      end

      assert TestAnimation3.init(3) == {:ok, []}
      assert TestAnimation3.init(:anything) == {:ok, []}
    end

    @tag task_id: 2
    test "__using__ does not provide a default implementation of handle_frame/3" do
      capture_io(:stderr, fn ->
        Code.compile_quoted do
          quote do
            defmodule TestAnimation4 do
              use DancingDots.Animation
            end
          end
        end
      end)

      refute function_exported?(TestAnimation4, :handle_frame, 3)
    end

    @tag task_id: 2
    test "__using__ sets Animation as the behaviour, emitting compilation warnings about missing callbacks" do
      compilation_warnings =
        capture_io(:stderr, fn ->
          Code.compile_quoted do
            quote do
              defmodule TestAnimation5 do
                use DancingDots.Animation
              end
            end
          end
        end)

      assert compilation_warnings =~
               "function handle_frame/3 required by behaviour DancingDots.Animation is not implemented"
    end
  end

  describe "Flicker module" do
    @tag task_id: 3
    test "implements Animation behaviour" do
      Code.ensure_loaded(DancingDots.Flicker)
      assert function_exported?(DancingDots.Flicker, :init, 1)
      assert function_exported?(DancingDots.Flicker, :handle_frame, 3)
    end

    @tag task_id: 3
    test "uses the default init/1 implementation" do
      assert DancingDots.Flicker.init([]) == {:ok, []}
      assert DancingDots.Flicker.init(:anything) == {:ok, :anything}
      assert DancingDots.Flicker.init({1, 2, 3}) == {:ok, {1, 2, 3}}
    end

    @tag task_id: 3
    test "every 4th frame, handle_frame/3 sets the dot's opacity to half the original value" do
      dot1 = %DancingDots.Dot{x: 10, y: 30, radius: 4, opacity: 1}
      dot2 = %DancingDots.Dot{x: 0, y: 0, radius: 10, opacity: 0.6}

      assert DancingDots.Flicker.handle_frame(dot1, 1, []) == %{dot1 | opacity: 1}
      assert DancingDots.Flicker.handle_frame(dot1, 2, []) == %{dot1 | opacity: 1}
      assert DancingDots.Flicker.handle_frame(dot1, 3, []) == %{dot1 | opacity: 1}
      assert DancingDots.Flicker.handle_frame(dot1, 4, []) == %{dot1 | opacity: 0.5}
      assert DancingDots.Flicker.handle_frame(dot1, 5, []) == %{dot1 | opacity: 1}
      assert DancingDots.Flicker.handle_frame(dot1, 6, []) == %{dot1 | opacity: 1}
      assert DancingDots.Flicker.handle_frame(dot1, 7, []) == %{dot1 | opacity: 1}
      assert DancingDots.Flicker.handle_frame(dot1, 8, []) == %{dot1 | opacity: 0.5}

      assert DancingDots.Flicker.handle_frame(dot2, 13, []) == %{dot2 | opacity: 0.6}
      assert DancingDots.Flicker.handle_frame(dot2, 14, []) == %{dot2 | opacity: 0.6}
      assert DancingDots.Flicker.handle_frame(dot2, 15, []) == %{dot2 | opacity: 0.6}
      assert DancingDots.Flicker.handle_frame(dot2, 16, []) == %{dot2 | opacity: 0.3}
      assert DancingDots.Flicker.handle_frame(dot2, 17, []) == %{dot2 | opacity: 0.6}
      assert DancingDots.Flicker.handle_frame(dot2, 18, []) == %{dot2 | opacity: 0.6}
      assert DancingDots.Flicker.handle_frame(dot2, 19, []) == %{dot2 | opacity: 0.6}
      assert DancingDots.Flicker.handle_frame(dot2, 20, []) == %{dot2 | opacity: 0.3}
    end

    @tag task_id: 3
    test "can be used in a dot group" do
      dot1 = %DancingDots.Dot{x: 44, y: 44, radius: 2, opacity: 0.8}
      dot2 = %DancingDots.Dot{x: 0, y: 0, radius: 3, opacity: 0.5}

      {:ok, dot_group} =
        DancingDots.DotGroup.new([dot1, dot2])
        |> DancingDots.DotGroup.add_animation(DancingDots.Flicker, [])

      assert dot_group ==
               %DancingDots.DotGroup{
                 animations_with_opts: [{DancingDots.Flicker, []}],
                 dots: [dot1, dot2]
               }

      assert DancingDots.DotGroup.render_dots(dot_group, 4) == [
               %{dot1 | opacity: 0.4},
               %{dot2 | opacity: 0.25}
             ]
    end
  end

  describe "Zoom module" do
    @tag task_id: 4
    test "implements Animation behaviour" do
      Code.ensure_loaded(DancingDots.Zoom)
      assert function_exported?(DancingDots.Zoom, :init, 1)
      assert function_exported?(DancingDots.Zoom, :handle_frame, 3)
    end

    @tag task_id: 4
    test "has a custom init/1 implementation that checks that a valid velocity was passed as an option" do
      assert DancingDots.Zoom.init(velocity: 10) == {:ok, [velocity: 10]}

      assert DancingDots.Zoom.init([]) ==
               {:error,
                "The :velocity option is required, and its value must be a number. Got: nil"}

      assert DancingDots.Zoom.init(velocity: "7") ==
               {:error,
                "The :velocity option is required, and its value must be a number. Got: \"7\""}
    end

    @tag task_id: 4
    test "the first frame, handle_frame/3 returns the dot unchanged" do
      dot = %DancingDots.Dot{x: 90, y: 90, radius: 100, opacity: 0.5}

      assert DancingDots.Zoom.handle_frame(dot, 1, velocity: 3) == dot
      assert DancingDots.Zoom.handle_frame(dot, 1, velocity: 30) == dot
      assert DancingDots.Zoom.handle_frame(dot, 1, velocity: -7) == dot
    end

    @tag task_id: 4
    test "every frame after the first, handle_frame/3 grows the dot's radius by the given positive velocity" do
      dot = %DancingDots.Dot{x: 90, y: 90, radius: 100, opacity: 0.5}

      assert DancingDots.Zoom.handle_frame(dot, 1, velocity: 3) == %{dot | radius: 100}
      assert DancingDots.Zoom.handle_frame(dot, 2, velocity: 3) == %{dot | radius: 103}
      assert DancingDots.Zoom.handle_frame(dot, 3, velocity: 3) == %{dot | radius: 106}
      assert DancingDots.Zoom.handle_frame(dot, 101, velocity: 3) == %{dot | radius: 400}
    end

    @tag task_id: 4
    test "every frame after the first, handle_frame/3 shrinks the dot's radius by the given negative velocity" do
      dot = %DancingDots.Dot{x: 100, y: 0, radius: 400, opacity: 0.9}

      assert DancingDots.Zoom.handle_frame(dot, 1, velocity: -1) == %{dot | radius: 400}
      assert DancingDots.Zoom.handle_frame(dot, 2, velocity: -1) == %{dot | radius: 399}
      assert DancingDots.Zoom.handle_frame(dot, 3, velocity: -1) == %{dot | radius: 398}
      assert DancingDots.Zoom.handle_frame(dot, 101, velocity: -1) == %{dot | radius: 300}
    end

    @tag task_id: 4
    test "can be used in a dot group" do
      dot1 = %DancingDots.Dot{x: 0, y: 0, radius: 100, opacity: 0.3}
      dot2 = %DancingDots.Dot{x: 0, y: 0, radius: 150, opacity: 0.3}

      {:ok, dot_group} =
        DancingDots.DotGroup.new([dot1, dot2])
        |> DancingDots.DotGroup.add_animation(DancingDots.Zoom, velocity: 10)

      assert dot_group ==
               %DancingDots.DotGroup{
                 animations_with_opts: [{DancingDots.Zoom, [velocity: 10]}],
                 dots: [dot1, dot2]
               }

      assert DancingDots.DotGroup.render_dots(dot_group, 50) == [
               %{dot1 | radius: 590},
               %{dot2 | radius: 640}
             ]
    end
  end
end
