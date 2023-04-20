defmodule SgfParsing do
  # Used to make recursive parsers lazy
  defmacrop lazy(parser) do
    quote do
      fn string -> unquote(parser).(string) end
    end
  end

  defmodule Sgf do
    defstruct properties: %{}, children: []
  end

  @type sgf :: %Sgf{properties: map, children: [sgf]}
  @doc """
  Parse a string into a Smart Game Format tree
  """
  @spec parse(encoded :: String.t()) :: {:ok, sgf} | {:error, String.t()}
  def parse(encoded) do
    parser = parse_tree_paren() |> eof()

    with {:ok, tree, ""} <- run_parser(parser, encoded) do
      {:ok, tree}
    else
      {:error, err, _rest} -> {:error, err}
    end
  end

  # TREE PARSER

  defp parse_tree() do
    parse_properties =
      char(?;)
      |> error("tree with no nodes")
      |> drop_and(many(parse_property()))
      |> map(&Map.new/1)

    parse_children =
      one_of([
        map(parse_tree(), &List.wrap/1),
        many(parse_tree_paren())
      ])
      |> lazy()

    lift2(&%Sgf{properties: &1, children: &2}, parse_properties, parse_children)
  end

  defp parse_tree_paren() do
    char(?()
    |> error("tree missing")
    |> drop_and(parse_tree())
    |> drop(char(?)))
  end

  defp parse_property() do
    parse_name =
      some(satisfy(&(&1 not in '[();')))
      |> map(&Enum.join(&1, ""))
      |> validate(&(&1 == String.upcase(&1)), "property must be in uppercase")

    parse_attributes =
      some(
        char(?[)
        |> error("properties without delimiter")
        |> drop_and(many(escaped(&(&1 != ?]))))
        |> drop(char(?]))
        |> map(&Enum.join(&1, ""))
      )

    lift2(&{&1, &2}, parse_name, parse_attributes)
  end

  defp escaped(p) do
    one_of([
      lift2(&escape/2, char(?\\), satisfy(fn _ -> true end)),
      map(char(?\t), fn _ -> " " end),
      satisfy(p)
    ])
  end

  defp escape("\\", "\\"), do: "\\"
  defp escape("\\", "\n"), do: ""
  defp escape("\\", " "), do: " "
  defp escape("\\", "\t"), do: " "
  defp escape("\\", "n"), do: "n"
  defp escape("\\", "t"), do: "t"
  defp escape("\\", "]"), do: "]"
  defp escape("\\", "["), do: "["
  defp escape("\\", other), do: "\\" <> other

  # PARSER COMBINATORS LIBRARY
  # Inspired from Haskell libraries like Parsec
  # and https://serokell.io/blog/parser-combinators-in-elixir

  defp run_parser(parser, string), do: parser.(string)

  defp eof(parser) do
    fn string ->
      with {:ok, _, ""} = ok <- parser.(string) do
        ok
      else
        {:ok, _a, rest} -> {:error, "Not end of file", rest}
        err -> err
      end
    end
  end

  defp satisfy(p) do
    fn
      <<char, rest::bitstring>> = string ->
        if p.(char) do
          {:ok, <<char>>, rest}
        else
          {:error, "unexpected #{char}", string}
        end

      "" ->
        {:error, "unexpected end of string", ""}
    end
  end

  defp char(c), do: satisfy(&(&1 == c)) |> error("expected character #{<<c>>}")

  defp some(parser) do
    fn input ->
      with {:ok, result, rest} <- parser.(input),
           {:ok, results, rest} <- many(parser).(rest) do
        {:ok, [result | results], rest}
      end
    end
  end

  defp many(parser) do
    fn input ->
      with {:ok, result, rest} <- some(parser).(input) do
        {:ok, result, rest}
      else
        {:error, _err, ^input} -> {:ok, [], input}
        err -> err
      end
    end
  end

  defp one_of(parsers) when is_list(parsers) do
    fn string ->
      Enum.reduce_while(parsers, {:error, "no parsers", string}, fn
        _parser, {:ok, _, _} = result -> {:halt, result}
        parser, _err -> {:cont, parser.(string)}
      end)
    end
  end

  defp map(parser, f) do
    fn string ->
      with {:ok, a, rest} <- parser.(string) do
        {:ok, f.(a), rest}
      end
    end
  end

  defp error(parser, err) do
    fn string ->
      with {:error, _err, rest} <- parser.(string) do
        {:error, err, rest}
      end
    end
  end

  defp drop(p1, p2) do
    fn string ->
      with {:ok, a, rest} <- p1.(string),
           {:ok, _, rest} <- p2.(rest) do
        {:ok, a, rest}
      end
    end
  end

  defp drop_and(p1, p2) do
    fn string ->
      with {:ok, _, rest} <- p1.(string) do
        p2.(rest)
      end
    end
  end

  defp lift2(pair, p1, p2) do
    fn string ->
      with {:ok, a, rest} <- p1.(string),
           {:ok, b, rest} <- p2.(rest) do
        {:ok, pair.(a, b), rest}
      end
    end
  end

  defp validate(parser, p, err) do
    fn string ->
      with {:ok, result, rest} <- parser.(string) do
        if p.(result) do
          {:ok, result, rest}
        else
          {:error, err, rest}
        end
      end
    end
  end
end
