defmodule TopSecretTest do
  use ExUnit.Case

  describe "to_ast/1" do
    @tag task_id: 1
    test "handles an empty string" do
      string = ""
      ast = {:__block__, [], []}

      assert TopSecret.to_ast(string) == ast
    end

    @tag task_id: 1
    test "handles a small code snippet" do
      string = """
      x = 7
      y = x - 2
      """

      ast =
        {:__block__, [],
         [
           {:=, [line: 1], [{:x, [line: 1], nil}, 7]},
           {:=, [line: 2], [{:y, [line: 2], nil}, {:-, [line: 2], [{:x, [line: 2], nil}, 2]}]}
         ]}

      assert TopSecret.to_ast(string) == ast
    end

    @tag task_id: 1
    test "handles a bigger code snippet" do
      string = """
      defmodule List do
        @spec delete([], any) :: []
        @spec delete([...], any) :: list
        def delete(list, element)
      end
      """

      ast = {
        :defmodule,
        [line: 1],
        [
          {:__aliases__, [line: 1], [:List]},
          [
            do: {
              :__block__,
              [],
              [
                {:@, [line: 2],
                 [
                   {:spec, [line: 2],
                    [{:"::", [line: 2], [{:delete, [line: 2], [[], {:any, [line: 2], nil}]}, []]}]}
                 ]},
                {:@, [line: 3],
                 [
                   {:spec, [line: 3],
                    [
                      {:"::", [line: 3],
                       [
                         {:delete, [line: 3], [[{:..., [line: 3], nil}], {:any, [line: 3], nil}]},
                         {:list, [line: 3], nil}
                       ]}
                    ]}
                 ]},
                {:def, [line: 4],
                 [{:delete, [line: 4], [{:list, [line: 4], nil}, {:element, [line: 4], nil}]}]}
              ]
            }
          ]
        ]
      }

      assert TopSecret.to_ast(string) == ast
    end
  end

  describe "decode_secret_message_part/2" do
    @tag task_id: 2
    test "returns the AST and accumulator unchanged (function call)" do
      string = "2 + 3"
      ast = TopSecret.to_ast(string)
      acc = ["le", "mo"]

      {actual_ast, actual_acc} = TopSecret.decode_secret_message_part(ast, acc)
      assert actual_ast == ast
      assert actual_acc == acc
    end

    @tag task_id: 2
    test "returns the AST and accumulator unchanged (literal values)" do
      acc = ["abc"]

      {actual_ast, actual_acc} = TopSecret.decode_secret_message_part(12, acc)
      assert actual_ast == 12
      assert actual_acc == acc

      {actual_ast, actual_acc} = TopSecret.decode_secret_message_part(true, acc)
      assert actual_ast == true
      assert actual_acc == acc

      {actual_ast, actual_acc} = TopSecret.decode_secret_message_part(:ok, acc)
      assert actual_ast == :ok
      assert actual_acc == acc

      {actual_ast, actual_acc} = TopSecret.decode_secret_message_part("meh", acc)
      assert actual_ast == "meh"
      assert actual_acc == acc
    end

    @tag task_id: 2
    test "appends a public function name to the accumulator" do
      string = "def fit(a, b, c), do: :scale"
      ast = TopSecret.to_ast(string)
      acc = ["at"]

      {actual_ast, actual_acc} = TopSecret.decode_secret_message_part(ast, acc)
      assert actual_ast == ast
      assert actual_acc == ["fit", "at"]
    end

    @tag task_id: 2
    test "appends a private function name to the accumulator" do
      string = "defp op(a, b), do: 2"
      ast = TopSecret.to_ast(string)
      acc = ["e", "ced"]

      {actual_ast, actual_acc} = TopSecret.decode_secret_message_part(ast, acc)
      assert actual_ast == ast
      assert actual_acc == ["op", "e", "ced"]
    end

    @tag task_id: 2
    test "ignores not top-level function definition" do
      string = """
      defmodule Math do
        def sin(x), do: do_sin(x)
        defp do_sin(x), do: nil
      end
      """

      ast = TopSecret.to_ast(string)
      acc = []

      {actual_ast, actual_acc} = TopSecret.decode_secret_message_part(ast, acc)
      assert actual_ast == ast
      assert actual_acc == acc
    end

    @tag task_id: 3
    test "function arity affects message part length" do
      string = "def adjust(a, b), do: :scale"
      ast = TopSecret.to_ast(string)
      acc = ["re"]

      {actual_ast, actual_acc} = TopSecret.decode_secret_message_part(ast, acc)
      assert actual_ast == ast
      assert actual_acc == ["ad", "re"]
    end

    @tag task_id: 3
    test "function arity 0 results in empty string" do
      string = "def adjust(), do: :scale"
      ast = TopSecret.to_ast(string)
      acc = ["re"]

      {actual_ast, actual_acc} = TopSecret.decode_secret_message_part(ast, acc)
      assert actual_ast == ast
      assert actual_acc == ["", "re"]
    end

    @tag task_id: 3
    test "function arity 0 and no parentheses results in empty string" do
      string = "def adjust, do: :scale"
      ast = TopSecret.to_ast(string)
      acc = ["re"]

      {actual_ast, actual_acc} = TopSecret.decode_secret_message_part(ast, acc)
      assert actual_ast == ast
      assert actual_acc == ["", "re"]
    end

    @tag task_id: 4
    test "works for public functions with a guard" do
      string = "def sign(a) when a >= 0, do: :+"
      ast = TopSecret.to_ast(string)
      acc = ["e"]

      {actual_ast, actual_acc} = TopSecret.decode_secret_message_part(ast, acc)
      assert actual_ast == ast
      assert actual_acc == ["s", "e"]
    end

    @tag task_id: 4
    test "works for private functions with a guard" do
      string = "defp do_sign(a) when a < 0, do: :-"
      ast = TopSecret.to_ast(string)
      acc = ["e"]

      {actual_ast, actual_acc} = TopSecret.decode_secret_message_part(ast, acc)
      assert actual_ast == ast
      assert actual_acc == ["d", "e"]
    end
  end

  describe "decode_secret_message/1" do
    @tag task_id: 5
    test "decodes a secret message from a single function definition" do
      code = """
      defmodule Notebook do
        def note(notebook, text) do
          add_to_notebook(notebook, text, append: true)
        end
      end
      """

      secret_message = "no"

      assert TopSecret.decode_secret_message(code) == secret_message
    end

    @tag task_id: 5
    test "decodes a secret message from a two function definitions" do
      code = """
      defmodule MyCalendar do
        def busy?(date, time) do
          Date.day_of_week(date) != 7 and
            time.hour in 10..16
        end

        def yesterday?(date) do
          Date.diff(Date.utc_today, date)
        end
      end
      """

      secret_message = "buy"

      assert TopSecret.decode_secret_message(code) == secret_message
    end

    @tag task_id: 5
    test "decodes a secret message from many function definitions" do
      code = """
        defmodule TotallyNotTopSecret do
          def force(mass, acceleration), do: mass * acceleration
          def uniform(from, to), do: rand.uniform(to - from) + from
          def data(%{metadata: metadata}, _opts), do: model(metadata)
          defp model(metadata, _opts), do: metadata |> less_data |> Enum.reverse() |> Enum.take(3)
          defp less_data(data, _opts), do: Enum.reject(data, &is_nil/1)
        end
      """

      secret_message = "foundamole"

      assert TopSecret.decode_secret_message(code) == secret_message
    end

    @tag task_id: 5
    test "decodes a secret message without a module definition" do
      code = """
      def force(mass, acceleration), do: mass * acceleration
      def uniform(from, to), do: rand.uniform(to - from) + from
      def data(%{metadata: metadata}, _opts), do: model(metadata)
      defp model(metadata, _opts), do: metadata |> less_data |> Enum.reverse() |> Enum.take(3)
      defp less_data(data, _opts), do: Enum.reject(data, &is_nil/1)
      """

      secret_message = "foundamole"

      assert TopSecret.decode_secret_message(code) == secret_message
    end

    @tag task_id: 5
    test "decodes another secret message from multiple modules" do
      code = """
      defmodule IOHelpers do
        def inspect(x, opts), do: IO.inspect(x, opts)
        def vi_or_vim(_env, _preference), do: :vim
        def signal(pid, string), do: send(pid, {:signal, string})
        def black(text, label), do: IO.ANSI.black <> label <> text <> IO.ANSI.reset()
      end

      defmodule TimeHelpers do
        defp est_to_cet(time), do: Time.add(time, 6 * 60 * 60)
      end

      defmodule ASTHelpers do
        def submodule?(m, _f, _args), do: String.contains?(m, ".")
        def module({m, _f, _args}), do: m
        def arity(_m, _f, args), do: length(args)
        defp nested?(x, y) when is_list(y), do: x in y
      end
      """

      secret_message = "invisiblesubmarine"

      assert TopSecret.decode_secret_message(code) == secret_message
    end
  end
end
