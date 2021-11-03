defmodule BookStore do
  @type book :: integer

  @base_price 800
  @discount %{
    1 => @base_price,
    2 => div(@base_price * 95, 100),
    3 => div(@base_price * 90, 100),
    4 => div(@base_price * 80, 100),
    5 => div(@base_price * 75, 100)
  }

  @doc """
  Calculate lowest price (in cents) for a shopping basket containing books.
  """
  @spec total(basket :: [book]) :: integer
  def total(basket) do
    basket
    |> frequencies
    |> Enum.sort()
    |> discounts()
    |> Enum.min()
  end

  defp frequencies(list) do
    list
    |> Enum.reduce(%{}, &Map.update(&2, &1, 1, fn count -> count + 1 end))
    |> Map.values()
  end

  defp discounts([]), do: [0]
  defp discounts([n]), do: [n * @base_price]

  defp discounts(frequencies) do
    for num_books <- 2..5,
        {picked, left} <- pick_n_distinct_from(num_books, frequencies),
        remove_picked = picked |> Enum.map(&(&1 - 1)) |> Enum.reject(&(&1 == 0)),
        costs <- discounts(Enum.sort(remove_picked ++ left)),
        do: costs + num_books * @discount[num_books]
  end

  defp pick_n_distinct_from(n, list) when length(list) < n, do: %{}
  defp pick_n_distinct_from(0, list), do: %{[] => list}
  defp pick_n_distinct_from(n, list) when length(list) == n, do: %{list => []}

  defp pick_n_distinct_from(n, list) do
    for pick <- Enum.uniq(list),
        {picked, left} <- pick_n_distinct_from(n - 1, list -- [pick]),
        into: %{},
        do: {Enum.sort([pick | picked]), left}
  end
end
