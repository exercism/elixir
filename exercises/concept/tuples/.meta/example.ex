defmodule KitchenCalculator do

  # Get the number component from the volume-unit pair '{:unit, volume}'

  def get_volume(volume_pair), do: elem(volume_pair, 1)

  # Convert to millilitre to another unit

  def to_millilitre({:cup, cups}) do
    {:millilitre, cups * 240}
  end

  def to_millilitre({:fluid_ounce, floz}) do
    {:millilitre, floz * 30}
  end

  def to_millilitre({:teaspoon, teaspoons}) do
    {:millilitre, teaspoons * 5}
  end

  def to_millilitre({:tablespoon, tablespoons}) do
    {:millilitre, tablespoons * 15}
  end

  def to_millilitre({:millilitre, _} = volume) do
    volume
  end

  # Convert from millilitre to another unit

  def from_millilitre({:millilitre, mls}, :cup) do
    {:cup, mls / 240}
  end

  def from_millilitre({:millilitre, mls}, :fluid_ounce) do
    {:fluid_ounce, mls / 30}
  end

  def from_millilitre({:millilitre, mls}, :teaspoon) do
    {:teaspoon, mls / 5}
  end

  def from_millilitre({:millilitre, mls}, :tablespoon) do
    {:tablespoon, mls / 15}
  end

  def from_millilitre({:millilitre, _} = volume, :millilitre) do
    volume
  end

  # convert from a supported unit to a supported unit

  def convert(volume_pair, to) do
    to_millilitre(volume_pair) |> from_millilitre(to)
  end
end
