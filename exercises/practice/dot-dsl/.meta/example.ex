defmodule Dot do
  # Normally matching on keywords is a bad idea as keyword lists can have
  # several orders (i.e. `[a: 1, b: 2]` and `[b: 2, a: 1]`). But in this case
  # only one keyword is allowed, so it's safe.
  defmacro graph(do: ast) do
    g = do_graph(ast)

    g |> Graph.canonical() |> Macro.escape()
  end

  defp do_graph(nil) do
    Graph.new()
  end

  defp do_graph({:__block__, _, stmts}) do
    Enum.reduce(stmts, Graph.new(), &do_stmt/2)
  end

  defp do_graph(stmt) do
    do_stmt(stmt, Graph.new())
  end

  defp do_stmt(stmt = {:graph, _, [kws]}, g) when is_list(kws) do
    if Keyword.keyword?(kws) do
      g |> Graph.put_attrs(kws)
    else
      raise_invalid_stmt(stmt)
    end
  end

  defp do_stmt({atom, _, nil}, g) when is_atom(atom) and atom != :-- do
    g |> Graph.add_node(atom)
  end

  defp do_stmt(stmt = {atom, _, [kws]}, g)
       when is_atom(atom) and atom != :-- and is_list(kws) do
    if Keyword.keyword?(kws) do
      g |> Graph.add_node(atom, kws)
    else
      raise_invalid_stmt(stmt)
    end
  end

  defp do_stmt({:--, _, [{a, _, nil}, {b, _, nil}]}, g)
       when is_atom(a) and is_atom(b) do
    g |> Graph.add_edge(a, b)
  end

  defp do_stmt(stmt = {:--, _, [{a, _, nil}, {b, _, [kws]}]}, g)
       when is_atom(a) and is_atom(b) and is_list(kws) do
    if Keyword.keyword?(kws) do
      g |> Graph.add_edge(a, b, kws)
    else
      raise_invalid_stmt(stmt)
    end
  end

  defp do_stmt(stmt, _) do
    raise_invalid_stmt(stmt)
  end

  defp raise_invalid_stmt(stmt) do
    raise ArgumentError, message: "Invalid statement: #{inspect(stmt)}"
  end
end
