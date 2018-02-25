if !System.get_env("EXERCISM_TEST_EXAMPLES") do
  Code.load_file("dot.exs", __DIR__)
end

ExUnit.start()
ExUnit.configure(exclude: :pending, trace: true)

defmodule DotTest do
  use ExUnit.Case
  require Dot

  # Expand at RunTime, used to avoid invalid macro calls preventing compilation
  # of the tests.
  #
  # Inspired by (read: clone of) Support.CompileHelpers.delay_compile in Ecto.
  defmacrop exprt(ast) do
    escaped = Macro.escape(ast)

    quote do
      Code.eval_quoted(unquote(escaped), [], __ENV__) |> elem(0)
    end
  end

  # @tag :pending
  test "empty graph" do
    assert %Graph{} ==
             exprt(
               Dot.graph do
               end
             )
  end

  @tag :pending
  test "graph with one node" do
    assert %Graph{nodes: [{:a, []}]} ==
             exprt(
               Dot.graph do
                 a
               end
             )
  end

  @tag :pending
  test "graph with one node with keywords" do
    assert %Graph{nodes: [{:a, [color: :green]}]} ==
             exprt(
               Dot.graph do
                 a(color: :green)
               end
             )
  end

  @tag :pending
  test "graph with one edge" do
    assert %Graph{edges: [{:a, :b, []}]} ==
             exprt(
               Dot.graph do
                 a -- b
               end
             )
  end

  @tag :pending
  test "graph with just attribute" do
    assert %Graph{attrs: [foo: 1]} ==
             exprt(
               Dot.graph do
                 graph(foo: 1)
               end
             )
  end

  @tag :pending
  test "graph with attributes" do
    assert %Graph{
             attrs: [bar: true, foo: 1, title: "Testing Attrs"],
             nodes: [{:a, [color: :green]}, {:b, [label: "Beta!"]}, {:c, []}],
             edges: [{:a, :b, [color: :blue]}, {:b, :c, []}]
           } ==
             exprt(
               Dot.graph do
                 graph(foo: 1)
                 graph(title: "Testing Attrs")
                 graph([])
                 a(color: :green)
                 c([])
                 b(label: "Beta!")
                 b -- c([])
                 a -- b(color: :blue)
                 graph(bar: true)
               end
             )
  end

  @tag :pending
  test "keywords stuck to graph without space" do
    assert_raise ArgumentError, fn ->
      exprt(
        Dot.graph do
          graph[[title: "Bad"]]
        end
      )
    end
  end

  @tag :pending
  test "keywords stuck to node without space" do
    assert_raise ArgumentError, fn ->
      exprt(
        Dot.graph do
          a[[label: "Alpha!"]]
        end
      )
    end
  end

  @tag :pending
  test "keywords stuck to edge without space" do
    assert_raise ArgumentError, fn ->
      exprt(
        Dot.graph do
          a -- b[[label: "Bad"]]
        end
      )
    end
  end

  @tag :pending
  test "invalid statement: int" do
    assert_raise ArgumentError, fn ->
      exprt(
        Dot.graph do
          a
          2
        end
      )
    end
  end

  @tag :pending
  test "invalid statement: list" do
    assert_raise ArgumentError, fn ->
      exprt(
        Dot.graph do
          [title: "Testing invalid"]
        end
      )
    end
  end

  @tag :pending
  test "invalid statement: qualified atom" do
    assert_raise ArgumentError, fn ->
      exprt(
        Dot.graph do
          Enum.map()
        end
      )
    end
  end

  @tag :pending
  test "invalid statement: graph with no keywords" do
    assert_raise ArgumentError, fn ->
      exprt(
        Dot.graph do
          Enum.map()
        end
      )
    end
  end

  @tag :pending
  test "two attribute lists" do
    assert_raise ArgumentError, fn ->
      exprt(
        Dot.graph do
          a([color: green][[label: "Alpha!"]])
        end
      )
      |> IO.inspect()
    end
  end

  @tag :pending
  test "non-keyword attribute list" do
    assert_raise ArgumentError, fn ->
      exprt(
        Dot.graph do
          a(["Alpha!", color: green])
        end
      )
    end
  end

  @tag :pending
  test "int edge" do
    assert_raise ArgumentError, fn ->
      exprt(
        Dot.graph do
          1 -- b
        end
      )
    end

    assert_raise ArgumentError, fn ->
      exprt(
        Dot.graph do
          a -- 2
        end
      )
    end
  end
end
