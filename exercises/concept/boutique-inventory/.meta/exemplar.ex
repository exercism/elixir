defmodule BoutiqueInventory do
  def sort_by_price(inventory) do
    Enum.sort_by(inventory, fn item -> Map.get(item, :price) end)
  end

  def with_missing_price(inventory) do
    Enum.filter(inventory, fn item -> Map.get(item, :price) == nil end)
  end

  def update_names(inventory, old_word, new_word) do
    Enum.map(inventory, fn item ->
      Map.update!(item, :name, fn name -> String.replace(name, old_word, new_word) end)
    end)
  end

  def increase_quantity(item, count) do
    Map.update(item, :quantity_by_size, %{}, fn quantity_by_size ->
      quantity_by_size
      |> Map.new(fn {size, quantity} -> {size, quantity + count} end)
    end)
  end

  def total_quantity(item) do
    Enum.reduce(Map.get(item, :quantity_by_size), 0, fn {_size, quantity}, acc ->
      acc + quantity
    end)
  end
end
