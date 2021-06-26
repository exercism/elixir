defmodule BookStore do
  use Agent
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
    # We use an Agent to memoize the discounts
    {:ok, _pid} = Agent.start_link(fn -> %{} end, name: :discount)

    basket
    |> frequencies
    |> Enum.sort()
    |> discounts()
    |> Enum.min()
  end

  def frequencies(list) do
    list
    |> Enum.map(&%{&1 => 1})
    |> Enum.reduce(%{}, &Map.merge(&1, &2, fn _item, a, b -> a + b end))
    |> Map.values()
  end

  def discounts([]), do: [0]
  def discounts([n]), do: [n * @base_price]

  def discounts(frequencies) do
    cached = Agent.get(:discount, &Map.get(&1, frequencies))

    if cached do
      cached
    else
      discount =
        for num_books <- 2..5,
            {picked, left} <- pick_n_distinct_from(num_books, frequencies),
            remove_picked = picked |> Enum.map(&(&1 - 1)) |> Enum.reject(&(&1 == 0)),
            costs <- discounts(Enum.sort(remove_picked ++ left)),
            do: costs + num_books * @discount[num_books]

      Agent.update(:discount, &Map.put(&1, frequencies, discount))
      discount
    end
  end

  def pick_n_distinct_from(n, list) when length(list) < n, do: %{}
  def pick_n_distinct_from(0, list), do: %{[] => list}
  def pick_n_distinct_from(n, list) when length(list) == n, do: %{list => []}

  def pick_n_distinct_from(n, list) do
    for pick <- Enum.uniq(list),
        {picked, left} <- pick_n_distinct_from(n - 1, list -- [pick]),
        into: %{},
        do: {Enum.sort([pick | picked]), left}
  end
end
