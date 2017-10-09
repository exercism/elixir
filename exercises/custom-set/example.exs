defmodule CustomSet do
  defstruct map: Map.new()

  @opaque t :: %__MODULE__{map: map}

  @spec new(Enum.t()) :: t
  def new(enumerable) do
    %CustomSet{map: Map.new(enumerable, fn x -> {x, true} end)}
  end

  @spec empty?(t) :: boolean
  def empty?(%CustomSet{map: map}) do
    Map.keys(map) |> Enum.empty?()
  end

  @spec contains?(t, any) :: boolean
  def contains?(%CustomSet{map: map}, element) do
    Map.has_key?(map, element)
  end

  @spec subset?(t, t) :: boolean
  def subset?(%CustomSet{map: map1}, %CustomSet{map: map2}) do
    if map_size(map1) <= map_size(map2) do
      Map.keys(map1) |> do_subset?(map2)
    else
      false
    end
  end

  defp do_subset?([], _), do: true

  defp do_subset?([key | rest], map2) do
    if Map.has_key?(map2, key) do
      do_subset?(rest, map2)
    else
      false
    end
  end

  @spec disjoint?(t, t) :: boolean
  def disjoint?(%CustomSet{map: map1}, %CustomSet{map: map2}) do
    total_size = map_size(map1) + map_size(map2)
    merged_size = map_size(Map.merge(map1, map2))
    total_size == merged_size
  end

  @spec equal?(t, t) :: boolean
  def equal?(%CustomSet{map: map1}, %CustomSet{map: map2}) do
    Map.equal?(map1, map2)
  end

  @spec add(t, any) :: t
  def add(%CustomSet{map: map}, element) do
    %CustomSet{map: Map.put(map, element, true)}
  end

  @spec intersection(t, t) :: t
  def intersection(%CustomSet{map: map1}, %CustomSet{map: map2}) do
    {map1, map2} = order_by_size(map1, map2)
    %CustomSet{map: Map.take(map2, Map.keys(map1))}
  end

  defp order_by_size(map1, map2) when map_size(map1) > map_size(map2), do: {map2, map1}
  defp order_by_size(map1, map2), do: {map1, map2}

  @spec difference(t, t) :: t
  def difference(%CustomSet{map: map1}, %CustomSet{map: map2}) do
    %CustomSet{map: Map.drop(map1, Map.keys(map2))}
  end

  @spec union(t, t) :: t
  def union(%CustomSet{map: map1}, %CustomSet{map: map2}) do
    %CustomSet{map: Map.merge(map1, map2)}
  end
end
