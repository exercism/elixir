defmodule CustomSet do
  @opaque t :: %__MODULE__{map: map}

  @spec new(Enum.t()) :: t
  def new(enumerable) do
  end

  @spec empty?(t) :: boolean
  def empty?(custom_set) do
  end

  @spec contains?(t, any) :: boolean
  def contains?(custom_set, element) do
  end

  @spec subset?(t, t) :: boolean
  def subset?(custom_set_1, custom_set_2) do
  end

  @spec disjoint?(t, t) :: boolean
  def disjoint?(custom_set_1, custom_set_2) do
  end

  @spec equal?(t, t) :: boolean
  def equal?(custom_set_1, custom_set_2) do
  end

  @spec add(t, any) :: t
  def add(custom_set, element) do
  end

  @spec intersection(t, t) :: t
  def intersection(custom_set_1, custom_set_2) do
  end

  @spec difference(t, t) :: t
  def difference(custom_set_1, custom_set_2) do
  end

  @spec union(t, t) :: t
  def union(custom_set_1, custom_set_2) do
  end
end
