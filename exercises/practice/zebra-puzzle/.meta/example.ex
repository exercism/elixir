defmodule ZebraPuzzle do
  @nationalities ~w(englishman norwegian ukrainian japanese spaniard)a
  @colors ~w(red green ivory yellow blue)a
  @drinks ~w(coffee tea milk orange_juice water)a
  @pets ~w(dog snails fox horse zebra)a
  @cigarettes ~w{old_gold kool chesterfield lucky_strike parliament}a

  @doc """
  Determine who drinks the water
  """
  @spec drinks_water() :: atom
  def drinks_water() do
    [%{nationality: nationality}] =
      solve_puzzle()
      |> Enum.filter(fn %{drink: drink} -> drink == :water end)

    nationality
  end

  @doc """
  Determine who owns the zebra
  """
  @spec owns_zebra() :: atom
  def owns_zebra() do
    [%{nationality: nationality}] =
      solve_puzzle()
      |> Enum.filter(fn %{pet: pet} -> pet == :zebra end)

    nationality
  end

  defp solve_puzzle() do
    #
    # Step 0: Consider all possible combinations of values
    #
    possibilities =
      Enum.flat_map(1..5, fn order ->
        Enum.flat_map(@colors, fn color ->
          Enum.flat_map(@drinks, fn drink ->
            Enum.flat_map(@nationalities, fn nationality ->
              Enum.flat_map(@cigarettes, fn cigarette ->
                Enum.map(@pets, fn pet ->
                  %{
                    order: order,
                    color: color,
                    drink: drink,
                    nationality: nationality,
                    cigarette: cigarette,
                    pet: pet
                  }
                end)
              end)
            end)
          end)
        end)
      end)

    #
    # Step 1: Add the direct constraints and filter possibilities
    #
    possibilities
    # The Englishman lives in the red house.
    |> filter_direct(:color, :red, :nationality, :englishman)
    # The Spaniard owns the dog.
    |> filter_direct(:nationality, :spaniard, :pet, :dog)
    # Coffee is drunk in the green house.
    |> filter_direct(:drink, :coffee, :color, :green)
    # The Ukrainian drinks tea.
    |> filter_direct(:drink, :tea, :nationality, :ukrainian)
    # The Old Gold smoker owns snails.
    |> filter_direct(:cigarette, :old_gold, :pet, :snails)
    # Kools are smoked in the yellow house.
    |> filter_direct(:cigarette, :kool, :color, :yellow)
    # Milk is drunk in the middle house.
    |> filter_direct(:drink, :milk, :order, 3)
    # The Norwegian lives in the first house.
    |> filter_direct(:nationality, :norwegian, :order, 1)
    # The Lucky Strike smoker drinks orange juice.
    |> filter_direct(:cigarette, :lucky_strike, :drink, :orange_juice)
    # The Japanese smokes Parliaments.
    |> filter_direct(:cigarette, :parliament, :nationality, :japanese)
    #
    # Step 2: Add indirect constraints (relations with neighbors)
    #
    |> filter_by_neighbors
    #
    # Step 3: Check if some values happen to be possibly in only one house,
    # add those constraints, filter and back to step 2 until all is solved
    #
    |> filter_by_unique_relations
  end

  defp filter_direct(list, field_1, value_1, field_2, value_2) do
    Enum.filter(list, fn element ->
      cond do
        element[field_1] == value_1 and element[field_2] == value_2 -> true
        element[field_1] == value_1 -> false
        element[field_2] == value_2 -> false
        true -> true
      end
    end)
  end

  defp filter_by_neighbors(list) do
    next_to = fn n -> [n - 1, n + 1] end

    filtered_list =
      list
      # The green house is immediately to the right of the ivory house.
      |> filter_indirect(:color, :green, fn n -> [n - 1] end, :color, :ivory, fn n -> [n + 1] end)
      # The man who smokes Chesterfields lives in the house next to the man with the fox.
      |> filter_indirect(:cigarette, :chesterfield, next_to, :pet, :fox, next_to)
      # Kools are smoked in the house next to the house where the horse is kept.
      |> filter_indirect(:cigarette, :kool, next_to, :pet, :horse, next_to)
      # The Norwegian lives next to the blue house.
      |> filter_indirect(:nationality, :norwegian, next_to, :color, :blue, next_to)

    # later filters may influence earlier ones, so we loop until there is no change
    if length(filtered_list) == length(list) do
      list
    else
      filter_by_neighbors(filtered_list)
    end
  end

  defp filter_indirect(list, field_1, value_1, order_1_to_2, field_2, value_2, order_2_to_1) do
    # Get all possible neighbor houses of possibilities with field_1: value_1
    # Ex: find all possible house numbers that neighbor a green house
    orders_2 = get_orders(list, field_1, value_1, order_1_to_2)
    # Only keep possibilities with field_2: value_2 in that neighborhood
    list2 = filter_neighbors(list, field_2, value_2, orders_2)

    # Same from the other perspective
    orders_1 = get_orders(list2, field_2, value_2, order_2_to_1)
    filter_neighbors(list2, field_1, value_1, orders_1)
  end

  defp get_orders(list, field, value, to_other_order) do
    list
    |> Enum.filter(&(&1[field] == value))
    |> Enum.map(fn %{order: order} -> to_other_order.(order) end)
    |> Enum.concat()
    |> Enum.uniq()
    |> Enum.filter(fn order -> 1 <= order and order <= 5 end)
  end

  defp filter_neighbors(list, field, value, orders) do
    Enum.filter(list, fn element ->
      cond do
        element[field] == value and element.order in orders -> true
        element[field] == value -> false
        length(orders) == 1 and element.order == hd(orders) -> false
        true -> true
      end
    end)
  end

  defp filter_by_unique_relations(list) do
    # Some values happen to exist only in one particular house number
    filter_parameters =
      list
      |> Enum.reduce(%{}, fn house, all ->
        Map.update(all, house[:order], values_to_set(house), fn previous ->
          Map.merge(previous, house, fn _field, val_1, val_2 -> MapSet.put(val_1, val_2) end)
        end)
      end)
      |> Enum.map(fn {order, house} ->
        house
        |> Enum.filter(fn {field, value} -> field != :order and MapSet.size(value) == 1 end)
        |> Enum.map(fn {field, value} -> {order, field, value |> MapSet.to_list() |> hd} end)
      end)
      |> Enum.concat()

    # Add those values as constraints and filter
    filtered_list =
      filter_parameters
      |> Enum.reduce(list, fn {order, f, v}, lst -> filter_direct(lst, :order, order, f, v) end)
      # Run the neighbors filter again
      |> filter_by_neighbors

    # Loop until no more change (final solution)
    if length(filtered_list) == length(list) do
      filtered_list
    else
      filter_by_unique_relations(filtered_list)
    end
  end

  defp values_to_set(map) do
    Map.new(map, fn {field, value} -> {field, MapSet.new([value])} end)
  end
end
